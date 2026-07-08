import admin from "firebase-admin";
import {createHash, randomUUID} from "node:crypto";
import {promises as fs} from "node:fs";
import path from "node:path";
import os from "node:os";
import {execFile} from "node:child_process";
import {promisify} from "node:util";

const execFileAsync = promisify(execFile);

const DEFAULT_AUDIO_FILE = "chant.mp3";
const DEFAULT_LYRICS_FILE = "chant.ass";
const DEFAULT_COVER_FILE = "cover.jpg";

function printUsageAndExit(message) {
	console.error(message);
	console.error(
		"Usage: node src/add_chant.mjs --project=<firebase-project-id> --dir=<chant-directory> [--name=<display-name>] [--id=<chant-id>] [--order=<number>] [--audio-file=<file>] [--lyrics-file=<file>] [--cover-file=<file>] [--overwrite] (--confirm|--dry-run)",
	);
	process.exit(1);
}

function parseCliArgs(argv) {
	const options = {
		project: "",
		dir: "",
		name: "",
		id: "",
		order: undefined,
		audioFile: DEFAULT_AUDIO_FILE,
		lyricsFile: DEFAULT_LYRICS_FILE,
		coverFile: DEFAULT_COVER_FILE,
		dryRun: false,
		confirm: false,
		overwrite: false,
	};

	for (let index = 0; index < argv.length; index += 1) {
		const arg = argv[index];

		if (arg === "--dry-run") {
			options.dryRun = true;
			continue;
		}
		if (arg === "--confirm") {
			options.confirm = true;
			continue;
		}
		if (arg === "--overwrite") {
			options.overwrite = true;
			continue;
		}

		const readValue = (key) => {
			if (arg === `--${key}` && argv[index + 1]) {
				index += 1;
				return argv[index];
			}
			if (arg.startsWith(`--${key}=`)) {
				return arg.slice(`--${key}=`.length);
			}
			return null;
		};

		const project = readValue("project");
		if (project !== null) {
			options.project = project;
			continue;
		}

		const dir = readValue("dir");
		if (dir !== null) {
			options.dir = dir;
			continue;
		}

		const name = readValue("name");
		if (name !== null) {
			options.name = name;
			continue;
		}

		const id = readValue("id");
		if (id !== null) {
			options.id = id;
			continue;
		}

		const orderRaw = readValue("order");
		if (orderRaw !== null) {
			options.order = Number(orderRaw);
			continue;
		}

		const audioFile = readValue("audio-file");
		if (audioFile !== null) {
			options.audioFile = audioFile;
			continue;
		}

		const lyricsFile = readValue("lyrics-file");
		if (lyricsFile !== null) {
			options.lyricsFile = lyricsFile;
			continue;
		}

		const coverFile = readValue("cover-file");
		if (coverFile !== null) {
			options.coverFile = coverFile;
			continue;
		}

		if (arg.startsWith("--")) {
			printUsageAndExit(`Unknown argument: ${arg}`);
		}
	}

	if (!options.confirm && !options.dryRun) {
		printUsageAndExit("Pass --confirm to write, or --dry-run to preview.");
	}
	if (options.confirm && options.dryRun) {
		printUsageAndExit("Use only one of --confirm or --dry-run.");
	}
	if (!options.project.trim()) {
		printUsageAndExit("Missing required argument: --project");
	}
	if (!options.dir.trim()) {
		printUsageAndExit("Missing required argument: --dir");
	}
	if (options.order !== undefined && (!Number.isInteger(options.order) || options.order < 0)) {
		printUsageAndExit("--order must be a non-negative integer.");
	}

	return options;
}

function toSlug(value) {
	return value
		.trim()
		.toLowerCase()
		.replace(/[^a-z0-9]+/g, "-")
		.replace(/^-+|-+$/g, "");
}

function titleFromSlug(value) {
	return value
		.split(/[-_]+/)
		.filter(Boolean)
		.map((part) => part.charAt(0).toUpperCase() + part.slice(1))
		.join(" ");
}

async function ensureFileExists(filePath, label) {
	try {
		const stats = await fs.stat(filePath);
		if (!stats.isFile()) {
			throw new Error(`${label} path is not a file: ${filePath}`);
		}
	} catch (error) {
		throw new Error(`Missing ${label} file: ${filePath}`, {cause: error});
	}
}

async function getFileInfo(filePath) {
	const [stats, buffer] = await Promise.all([fs.stat(filePath), fs.readFile(filePath)]);
	const sha256 = createHash("sha256").update(buffer).digest("hex");
	return {
		bytes: stats.size,
		sha256,
	};
}

async function getAudioLengthSeconds(audioFilePath) {
	// Prefer ffprobe when available because it is stable and precise for many formats.
	try {
		const {stdout} = await execFileAsync("ffprobe", [
			"-v",
			"error",
			"-show_entries",
			"format=duration",
			"-of",
			"default=noprint_wrappers=1:nokey=1",
			audioFilePath,
		]);
		const parsed = Number.parseFloat(stdout.trim());
		if (Number.isFinite(parsed) && parsed > 0) {
			return Math.max(1, Math.round(parsed));
		}
	} catch {
		// Continue to macOS fallback.
	}

	if (os.platform() === "darwin") {
		try {
			const {stdout} = await execFileAsync("afinfo", [audioFilePath]);
			const match = stdout.match(/estimated duration:\s*([0-9.]+)\s*sec/i);
			if (match) {
				const parsed = Number.parseFloat(match[1]);
				if (Number.isFinite(parsed) && parsed > 0) {
					return Math.max(1, Math.round(parsed));
				}
			}
		} catch {
			// Fall through to hard failure with actionable message.
		}
	}

	throw new Error(
		"Could not determine audio length. Install ffmpeg (ffprobe) or run on macOS with afinfo available.",
	);
}

function initFirebase(projectId) {
	if (admin.apps.length) {
		return admin.apps[0];
	}

	const serviceAccountEnv = process.env.FIREBASE_SERVICE_ACCOUNT;
	if (serviceAccountEnv) {
		const serviceAccount = JSON.parse(serviceAccountEnv);
		return admin.initializeApp({
			credential: admin.credential.cert({
				projectId: serviceAccount.project_id,
				clientEmail: serviceAccount.client_email,
				privateKey: serviceAccount.private_key.replace(/\\n/g, "\n"),
			}),
			projectId,
		});
	}

	// Use Application Default Credentials if service account JSON is not supplied.
	return admin.initializeApp({projectId});
}

async function computeOrder(firestore, providedOrder) {
	if (providedOrder !== undefined) {
		return providedOrder;
	}

	const latest = await firestore
		.collection("chants")
		.orderBy("order", "desc")
		.limit(1)
		.get();

	if (latest.empty) {
		return 0;
	}

	const current = latest.docs[0].data().order;
	return Number.isInteger(current) ? current + 1 : 0;
}

async function uploadAsset(bucket, localPath, remotePath) {
	await bucket.upload(localPath, {
		destination: remotePath,
		resumable: false,
	});
}

async function main() {
	const options = parseCliArgs(process.argv.slice(2));
	const chantDir = path.resolve(process.cwd(), options.dir);
	const chantId = options.id.trim() || toSlug(path.basename(chantDir));

	if (!chantId) {
		throw new Error("Could not resolve chant id. Pass --id explicitly.");
	}

	const chantName = options.name.trim() || titleFromSlug(path.basename(chantDir));
	if (!chantName) {
		throw new Error("Could not resolve chant name. Pass --name explicitly.");
	}

	const audioPath = path.join(chantDir, options.audioFile);
	const lyricsPath = path.join(chantDir, options.lyricsFile);
	const coverPath = path.join(chantDir, options.coverFile);

	await Promise.all([
		ensureFileExists(audioPath, "audio"),
		ensureFileExists(lyricsPath, "lyrics"),
		ensureFileExists(coverPath, "cover"),
	]);

	const [audioInfo, lyricsInfo, coverInfo, audioLengthSeconds] = await Promise.all([
		getFileInfo(audioPath),
		getFileInfo(lyricsPath),
		getFileInfo(coverPath),
		getAudioLengthSeconds(audioPath),
	]);

	const app = initFirebase(options.project);
	const firestore = admin.firestore(app);

	const chantDocRef = firestore.collection("chants").doc(chantId);
	const existing = await chantDocRef.get();

	if (existing.exists && !options.overwrite) {
		throw new Error(
			`Chant '${chantId}' already exists. Pass --overwrite to update existing records.`,
		);
	}

	const order = await computeOrder(firestore, options.order);
	const now = Date.now();

	const payload = {
		id: chantId,
		name: chantName,
		order,
		length: audioLengthSeconds,
		metaData: {
			id: chantId,
			audioVersion: 1,
			lyricsVersion: 1,
			coverVersion: 1,
			audioSha256: audioInfo.sha256,
			lyricsSha256: lyricsInfo.sha256,
			coverSha256: coverInfo.sha256,
			audioBytes: audioInfo.bytes,
			lyricsBytes: lyricsInfo.bytes,
			coverBytes: coverInfo.bytes,
			updatedAt: now,
		},
	};

	const bucketName = app.options.storageBucket || `${options.project}.appspot.com`;
	const bucket = admin.storage(app).bucket(bucketName);

	const audioRemotePath = `chants/${chantId}/${DEFAULT_AUDIO_FILE}`;
	const lyricsRemotePath = `chants/${chantId}/${DEFAULT_LYRICS_FILE}`;
	const coverRemotePath = `chants/${chantId}/${DEFAULT_COVER_FILE}`;

	if (options.dryRun) {
		console.log(`Dry-run for project '${options.project}'.`);
		console.log("Would upload assets:");
		console.log(`- ${audioPath} -> gs://${bucketName}/${audioRemotePath}`);
		console.log(`- ${lyricsPath} -> gs://${bucketName}/${lyricsRemotePath}`);
		console.log(`- ${coverPath} -> gs://${bucketName}/${coverRemotePath}`);
		console.log("Would write Firestore document:");
		console.log(`- chants/${chantId}`);
		console.log(JSON.stringify(payload, null, 2));
		return;
	}

	await Promise.all([
		uploadAsset(bucket, audioPath, audioRemotePath),
		uploadAsset(bucket, lyricsPath, lyricsRemotePath),
		uploadAsset(bucket, coverPath, coverRemotePath),
	]);

	await chantDocRef.set(payload, {merge: true});

	console.log("Chant uploaded successfully.");
	console.log(`- id: ${chantId}`);
	console.log(`- name: ${chantName}`);
	console.log(`- order: ${order}`);
	console.log(`- length seconds: ${audioLengthSeconds}`);
	console.log(`- firestore: chants/${chantId}`);
	console.log(`- storage: gs://${bucketName}/chants/${chantId}/...`);
}

main().catch((error) => {
	const errorId = randomUUID();
	console.error(`Failed to add chant [${errorId}]`);
	console.error(error);
	process.exit(1);
});



