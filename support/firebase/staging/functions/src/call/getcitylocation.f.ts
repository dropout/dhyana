import {onCall} from "firebase-functions/https";
import {logger} from "firebase-functions";
import {safeEnvVar} from "../util/safe_shit";
import {PlacesClient} from "@googlemaps/places";
import {CitySearchResult} from "../models";
import {z} from "zod";
import {CitySearchResultSchema} from "../util/schema";

// Extend an autocomplete CitySearchResponse with a location
export default onCall(async function getCityLocation(req) {

  // Parse input
  const parsed = CitySearchResultSchema.safeParse(req.data?.citySearchResult);
  if (!parsed.success) {
    logger.info("Request data", req);
    logger.error("Invalid CitySearchResult payload", z.prettifyError(parsed.error));
    throw new Error("Invalid CitySearchResult payload");
  }
  const city: CitySearchResult = parsed.data;

  // Create PlacesClient
  const GOOGLE_MAPS_API_KEY = safeEnvVar("GOOGLE_MAPS_API_KEY");
  const placesClient = new PlacesClient({
    apiKey: GOOGLE_MAPS_API_KEY,
  });

  // Prefer placeId (turn into Places API resource name), fallback to name
  const place = city.placeId ? `places/${city.placeId}` : city.name;
  if (!place) {
    throw new Error("Request must include a placeId or name");
  }

  // Only interested in location field for latlng
  const callOptions = {
    otherArgs: {
      headers: {
        "X-Goog-FieldMask": "location",
      },
    },
  };

  const placeDetailsResponse = await placesClient.getPlace({
    name: place,
  }, callOptions);

  // Extract place location and extend city with lat/lng
  const location = placeDetailsResponse[0]?.location;
  if (!location) {
    logger.error("Place details missing or lacking location", placeDetailsResponse);
    throw new Error("Could not find location (lat/lng) for place");
  }

  if (location.latitude == null || location.longitude == null) {
    logger.error("Location object missing latitude or longitude", location);
    throw new Error("Could not find latitude/longitude for place");
  }

  const result: CitySearchResult = {
    ...city,
    location: {
      latitude: location.latitude,
      longitude: location.longitude,
    },
  };

  return {
    result
  };

});
