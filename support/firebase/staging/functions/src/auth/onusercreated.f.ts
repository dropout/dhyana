import * as functions from "firebase-functions/v1";
import sharp from "sharp";
import { encode } from "blurhash";
import { getFirestore } from "firebase-admin/firestore";
import { UserRecord } from "firebase-functions/v1/auth";

export default functions.auth.user().onCreate(async (user: UserRecord) => {

  // If photo is not available, we don't need to generate a blurhash
  if (!user.photoURL) {
    return;
  }

  try {
    // 1. Fetch image bytes from OAuth photoURL
    const response = await fetch(user.photoURL);
    const buffer = await response.arrayBuffer();

    // 2. Process image raw pixels using Sharp
    const { data, info } = await sharp(Buffer.from(buffer))
      .raw()
      .ensureAlpha()
      .resize(32, 32, { fit: "inside" })
      .toBuffer({ resolveWithObject: true });

    // 3. Generate BlurHash
    const hash = encode(new Uint8ClampedArray(data), info.width, info.height, 32, 3);

    // 4. Save to Firestore asynchronously without blocking sign-up
    await getFirestore().collection("profiles").doc(user.uid).set({
      photoBlurhash: hash,
    }, { merge: true });
    
  } catch (err) {
    functions.logger.error("Failed to generate BlurHash for user", user.uid, err);
  }

  // Handle the user creation event here
  functions.logger.log("Blurhash create for user:", user.uid);
});
