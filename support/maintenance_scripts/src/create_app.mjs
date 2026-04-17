import admin from "firebase-admin";

let _initialized = false;

export const initFirebaseApp = async () => {
  if (_initialized) {
    console.info("Default firebase app already initialized!")
    return;
  }

  const serviceAccountEnv = process.env.FIREBASE_SERVICE_ACCOUNT;
  if (!serviceAccountEnv) {
    throw new Error("FIREBASE_SERVICE_ACCOUNT environment variable is not defined");
  }
  const serviceAccount = JSON.parse(serviceAccountEnv);
  const app = admin.initializeApp({
    credential: admin.credential.cert({
      projectId: serviceAccount.project_id,
      clientEmail: serviceAccount.client_email,
      privateKey: serviceAccount.private_key.replace(/\\n/g, "\n"),
    }),
  });
  _initialized = true;
  return app;

}
