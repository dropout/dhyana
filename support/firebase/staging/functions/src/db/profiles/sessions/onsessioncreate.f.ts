import {
  FieldValue,
  Firestore,
  getFirestore,
  QueryDocumentSnapshot,
} from "firebase-admin/firestore";
import {
  FirestoreEvent,
  onDocumentCreated,
} from "firebase-functions/firestore";
import {logger} from "firebase-functions";
import { Session } from "../../../models";

const NUM_SHARDS = 10; // Number of shards for global stats

export default onDocumentCreated(
  "profiles/{profileId}/sessions/{sessionId}",
  async (event: FirestoreEvent<QueryDocumentSnapshot | undefined,
    { profileId: string; sessionId: string }>) => {

      let session:Session;
      if (event.data == null || typeof event.data == "undefined") {
        logger.error("Event data is null or undefined, unable to process session stats");
        return;
      } else {
        session = event.data.data() as Session;
      }      

      const db: Firestore = getFirestore();

      const snapshot = event.data;
      if (!snapshot) return;

      const sessionData = snapshot.data();
      const endTimeMillisecondsSinceEpoch = session.endTime || new Date().getTime();
    
      // Cloud Functions guarantees a unique event ID per trigger execution
      const eventId = event.id; 

      // References
      const idempotencyRef = db.collection("logged_sessions").doc(eventId);
    
      // Pick a random shard (0 to NUM_SHARDS - 1)
      // Reference for the global stats shard
      const globalShardId = Math.floor(Math.random() * NUM_SHARDS).toString(10);
      const globalShardRef = db.doc(`global_stats/all_time/shards/${globalShardId}`);
      
      // Calculate UTC Date String for Global Stats    
      // Assuming sessionData.endTime is a number representing milliseconds since epoch.
      // Create a string YYYY-MM-DD from the UTC date
      const endDateTime = new Date(endTimeMillisecondsSinceEpoch);    
      const utcDateString = `${endDateTime.getUTCFullYear()}-${String(endDateTime.getUTCMonth() + 1).padStart(2, '0')}-${String(endDateTime.getUTCDate()).padStart(2, '0')}`;

      // Reference for the daily stats shard
      const dailyShardId = Math.floor(Math.random() * NUM_SHARDS).toString(10);
      const globalDailyShardRef = db.doc(`global_stats/daily_${utcDateString}/shards/${dailyShardId}`);

      try {        
        await db.runTransaction(async (transaction) => {

          // Idempotency Check: Did we already process this exact event?
          const eventDoc = await transaction.get(idempotencyRef);
          if (eventDoc.exists) {
            console.log(`Event ${eventId} already processed. Skipping.`);
            return;
          }

          // Extract session metrics
          const durationInSeconds = sessionData.duration || 0;          
          const sessionType = sessionData.type; // e.g., "sitting" or "chanting"
            
          // Prepare Shard Updates
          const globalUpdates: Record<string, any> = {
            totalSessions: FieldValue.increment(1),
            totalDurationInSeconds: FieldValue.increment(durationInSeconds),
          };
          
          if (sessionType) {
            globalUpdates[`type_${sessionType}`] = FieldValue.increment(1);
          }

          // Commit everything atomically. We use { merge: true } so we don't 
          // overwrite existing fields on the stats documents.
          transaction.set(idempotencyRef, { processedAt: FieldValue.serverTimestamp() });
          transaction.set(globalShardRef, globalUpdates, { merge: true });
          transaction.set(globalDailyShardRef, globalUpdates, { merge: true });
      });
      
      logger.info(`Successfully processed session stats for profile: ${event.params.profileId}`);
    } catch (err) {
      logger.error("Unable to update tag references", err);
      throw err;
    }
  }
);
