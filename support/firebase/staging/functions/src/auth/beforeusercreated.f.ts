import {
  AuthBlockingEvent,
  AuthUserRecord,
  beforeUserCreated,
  HttpsError,
} from "firebase-functions/v2/identity";
import {
  Firestore,
  getFirestore,
} from "firebase-admin/firestore";

import {logger} from "firebase-functions";
import {Profile} from "../models";

export default beforeUserCreated(async (event:AuthBlockingEvent) => {
  let userRecord:AuthUserRecord;
  if (event.data == null || typeof event.data == "undefined") {
    logger.error("Event data is null or undefined, unable to create profile");
    return;
  } else {
    userRecord = event.data;
  }

  try {
    const db: Firestore = getFirestore();

    const profile: Profile = {
      id: userRecord.uid,
      firstName: "",
      lastName: userRecord.displayName || "",
      email: userRecord.email || "",
      photoUrl: null,
      photoBlurhash: null,
      signupDate: Date.now(),
      statsReport: {
        consecutiveDays: {
          current: 0,
          longest: 0,
          startedAt: null,
          lastChecked: null,
        },
        milestoneProgress: {
          completedDaysCount: 0,
          // Update default targetDaysCount in
          // MilestoneProgress client model too
          targetDaysCount: 7,
          sessions: [],
        },
        milestoneCount: 0,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        firstSessionDate: null,
        lastSessionDate: null,
      },
      completed: false,
    };

    await db.collection("profiles").doc(userRecord.uid).set(profile);
  } catch (err) {
    logger.error("Error occured while creating a profile", err);
    throw new HttpsError(
      "internal",
      "Error occured while creating a profile",
      err
    );
  }
});
