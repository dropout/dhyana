import {setGlobalOptions} from "firebase-functions/v2";
import * as glob from "glob";
import * as path from "path";

setGlobalOptions({
  region: "europe-west3",
});

// 1. Scan for compiled .js files inside __dirname
const functionFiles = glob.sync("./**/*.f.js", {
  cwd: __dirname,
  ignore: [
    "./index.js", // Exclude compiled entry point
    "./admin.js", // Exclude admin helper
    "./**/*.spec.js", // Exclude test files
    "./**/_*.js", // Exclude private utility modules
  ],
});


// 2. Map files to exported namespaces
for (const file of functionFiles) {
  // Path: "auth/beforeCreated.f.js" -> ["auth", "beforeCreated"]
  const normalizedPath = file.replace(/\.f\.js$/, "");
  const segments = normalizedPath.split("/");

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  let exportGroup: Record<string, any> = exports;

  // Build nested export groups
  // Skip the first segment '.'
  for (let i = 1; i < segments.length - 1; i++) {
    const groupName = segments[i];
    exportGroup[groupName] = exportGroup[groupName] || {};
    exportGroup = exportGroup[groupName];
  }

  const exportName = segments[segments.length - 1];

  // Resolve absolute path inside the compiled runtime directory
  const filePath = path.resolve(__dirname, file);
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const functionModule = require(filePath);

  // Extract the function handler
  const handler = functionModule.default || functionModule[exportName];

  if (handler) {
    exportGroup[exportName] = handler;
  }
}
