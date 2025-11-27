"use strict";

import {initializeApp} from "firebase-admin/app";
import {setGlobalOptions} from "firebase-functions/v2";
import {exportFunctions} from "better-firebase-functions";

const usedSecrets = [
  "GOOGLE_MAPS_API_KEY",
];

setGlobalOptions({
  secrets: usedSecrets,
  region: "europe-central2",
});

initializeApp();

exportFunctions({
  __filename,
  exports,
  functionDirectoryPath: "./",
  searchGlob: "**/*.f.js", // exports against compiled js files
});
