import admin from "firebase-admin";

const STAGING_PROJECT_ID = "dhyana-staging";
const GEOHASH_ALPHABET = "0123456789bcdefghjkmnpqrstuvwxyz";
const GEOHASH_PRECISION = 8;
const DEFAULT_PHOTO_URL =
  "https://firebasestorage.googleapis.com/v0/b/dhyana-timer.appspot.com/o/profiles%2Fdefault%2Fphoto.jpg?alt=media&token=0d5bb454-7ce3-4f27-9ccf-7822fd559bb4";
const DEFAULT_PHOTO_BLURHASH = "KCJPn?0N^h~AWA%10i%0EQ";

const HUNGARIAN_CITIES = [
  {name: "Budapest", latitude: 47.497913, longitude: 19.040236},
  {name: "Debrecen", latitude: 47.531605, longitude: 21.627312},
  {name: "Szeged", latitude: 46.25301, longitude: 20.141425},
  {name: "Miskolc", latitude: 48.103478, longitude: 20.778438},
  {name: "Pecs", latitude: 46.072735, longitude: 18.232266},
  {name: "Gyor", latitude: 47.687456, longitude: 17.650398},
  {name: "Nyiregyhaza", latitude: 47.949532, longitude: 21.724405},
  {name: "Kecskemet", latitude: 46.896371, longitude: 19.689686},
  {name: "Szekesfehervar", latitude: 47.186026, longitude: 18.422135},
  {name: "Szombathely", latitude: 47.230685, longitude: 16.621844},
  {name: "Szolnok", latitude: 47.17266, longitude: 20.194018},
  {name: "Tatabanya", latitude: 47.569246, longitude: 18.404818},
  {name: "Kaposvar", latitude: 46.35936, longitude: 17.796763},
  {name: "Bekescsaba", latitude: 46.673593, longitude: 21.087731},
  {name: "Zalaegerszeg", latitude: 46.844526, longitude: 16.843889},
  {name: "Eger", latitude: 47.902534, longitude: 20.377228},
  {name: "Nagykanizsa", latitude: 46.453471, longitude: 16.992392},
  {name: "Sopron", latitude: 47.681662, longitude: 16.584479},
];

const args = new Set(process.argv.slice(2));
const cliArgs = process.argv.slice(2);
const projectArg = cliArgs.find((arg) => arg.startsWith("--project="));
const projectIndex = cliArgs.indexOf("--project");
const projectIdFromEquals = projectArg ? projectArg.split("=")[1] : "";
const projectIdFromNext =
  projectIndex >= 0 && cliArgs[projectIndex + 1]
    ? cliArgs[projectIndex + 1]
    : "";
const projectId = projectIdFromEquals || projectIdFromNext;
const isDryRun = args.has("--dry-run");
const isConfirmed = args.has("--confirm");

function encodeGeohash(latitude, longitude, precision = GEOHASH_PRECISION) {
  let latMin = -90;
  let latMax = 90;
  let lngMin = -180;
  let lngMax = 180;
  let hash = "";
  let bit = 0;
  let currentChar = 0;
  let isEvenBit = true;

  while (hash.length < precision) {
    if (isEvenBit) {
      const lngMid = (lngMin + lngMax) / 2;
      if (longitude >= lngMid) {
        currentChar = (currentChar << 1) + 1;
        lngMin = lngMid;
      } else {
        currentChar = currentChar << 1;
        lngMax = lngMid;
      }
    } else {
      const latMid = (latMin + latMax) / 2;
      if (latitude >= latMid) {
        currentChar = (currentChar << 1) + 1;
        latMin = latMid;
      } else {
        currentChar = currentChar << 1;
        latMax = latMid;
      }
    }

    isEvenBit = !isEvenBit;
    bit += 1;

    if (bit === 5) {
      hash += GEOHASH_ALPHABET[currentChar];
      bit = 0;
      currentChar = 0;
    }
  }

  return hash;
}

function buildPresencePayloads() {
  const now = Date.now();

  return HUNGARIAN_CITIES.map((city, index) => {
    const seq = String(index + 1).padStart(3, "0");
    const docId = `staging-hu-${seq}`;
    const geoHash = encodeGeohash(city.latitude, city.longitude);
    const startedAt = now - index * 60_000;

    return {
      docId,
      payload: {
        id: docId,
        profile: {
          id: `profile-${docId}`,
          firstName: "Meditator",
          lastName: seq,
          photoUrl: DEFAULT_PHOTO_URL,
          photoBlurhash: DEFAULT_PHOTO_BLURHASH,
        },
        startedAt,
        location: {
          name: city.name,
          latLng: {
            latitude: city.latitude,
            longitude: city.longitude,
          },
          geoHash,
        },
        // Compatibility field for current nearby query implementation.
        geoHash,
      },
    };
  });
}

function printUsageAndExit(message) {
  console.error(message);
  console.error(
    "Usage: node src/seed_presence_hungary.mjs --project=dhyana-staging (--confirm|--dry-run)",
  );
  process.exit(1);
}

if (HUNGARIAN_CITIES.length !== 18) {
  printUsageAndExit("Seeder requires exactly 18 Hungarian cities.");
}

if (!projectId) {
  printUsageAndExit("Missing required --project argument.");
}

if (projectId !== STAGING_PROJECT_ID) {
  printUsageAndExit(
    `Refusing to run for project '${projectId}'. Allowed project: '${STAGING_PROJECT_ID}'.`,
  );
}

if (!isDryRun && !isConfirmed) {
  printUsageAndExit("Pass --confirm to write, or --dry-run to preview.");
}

const records = buildPresencePayloads();

if (isDryRun) {
  console.log(`Dry-run for project '${projectId}'.`);
  console.log(`Would upsert ${records.length} documents into 'presence'.`);
  console.log("First document preview:");
  console.log(JSON.stringify(records[0], null, 2));
  process.exit(0);
}

if (!admin.apps.length) {
  admin.initializeApp({projectId});
}

const firestore = admin.firestore();

try {
  const batch = firestore.batch();

  for (const record of records) {
    const docRef = firestore.collection("presence").doc(record.docId);
    batch.set(docRef, record.payload, {merge: true});
  }

  await batch.commit();

  console.log(`Seeded ${records.length} documents in 'presence'.`);
  console.log("Document ids:", records.map((record) => record.docId).join(", "));
} catch (error) {
  console.error("Failed to seed presence data:", error);
  process.exit(1);
}