import {QueryDocumentSnapshot} from "firebase-admin/firestore";
import {FirestoreEvent} from "firebase-functions/firestore";
import {Profile} from "../models";

/**
 * Safely gets environment variable because using
 * null operator not allowed by linting.
 * @param {string} name
 * @return {string}
 */
export function safeEnvVar(name: string): string {
  const value = process.env[name];
  if (value == null || typeof value !== "string") {
    throw new Error(`Environment variable ${name} not found`);
  }
  return value;
}

/**
 * Safely gets profile from firestore trigger event,
 * because using null operator not allowed by linting.
 * Its impossible to write a proper type definition
 * for FirestoreEvent, so we have to use Object for jsdoc.
 *
 * @param {Object} event
 * @return {Profile}
 */
export function safeProfileFromEvent(
  event: FirestoreEvent<QueryDocumentSnapshot | undefined,
  { profileId: string }>
): Profile {
  if (
    event.data == null ||
    typeof event.data == "undefined" ||
    !event.data.exists
  ) {
    throw new Error("Profile not found");
  } else {
    return event.data.data() as Profile;
  }
}
