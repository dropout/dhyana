import {onCall} from "firebase-functions/https";
import {logger} from "firebase-functions";
import {safeEnvVar} from "../util/safe_shit";
import {PlacesClient} from "@googlemaps/places";
import {CitySearchResponse, CitySearchResult} from "../models";
import CitySearchResultSchema from "../util/schema";

// Search for cities using Google Maps Places Autocomplete API
export default onCall(async function citySearch(req)  {

  const queryString: string = (req.data?.queryString ?? "").trim();
  const results: Array<CitySearchResult> = [];
  try {

    // If there is no queryString, return empty results
    if (!queryString) {
      logger.warn("citySearch: Missing queryString");
      return {queryString: "", results: []} as CitySearchResponse;
    }

    // Create PlacesClient
    const GOOGLE_MAPS_API_KEY = safeEnvVar("GOOGLE_MAPS_API_KEY");
    const placesClient = new PlacesClient({
      apiKey: GOOGLE_MAPS_API_KEY,
    });

    // Execute autocomplete request
    const autoCompleteResponse = await placesClient.autocompletePlaces({
      input: queryString,
      includedPrimaryTypes: ["locality"], // https://developers.google.com/maps/documentation/places/web-service/place-types

    });

    // Make sure we have suggestions
    // The response is an array, but we only care about the first item
    const result = (Array.isArray(autoCompleteResponse) && autoCompleteResponse[0]) ? autoCompleteResponse[0] : {suggestions: []};
    const suggestions = Array.isArray(result?.suggestions) ? result.suggestions : [];

    // Parse suggestions into CitySearchResult[]
    for (const suggestion of suggestions) {
      const prediction = suggestion.placePrediction;
      const rawCityResult: unknown = {
        placeId: prediction?.placeId,
        name: prediction?.text?.text ?? prediction?.structuredFormat?.mainText?.text,
        types: Array.isArray(prediction?.types) ? prediction.types : [],
        location: null,
      };
      const parsed = CitySearchResultSchema.safeParse(rawCityResult);

      // Skip invalid results
      if (!parsed.success) {
        logger.warn("citySearch: Failed to parse placePrediction", {
          placeId: prediction?.placeId,
          issues: parsed.error.issues,
        });
        continue;
      }

      // Collect parsed result
      const cityResult: CitySearchResult = parsed.data;
      results.push(cityResult);
    }


  } catch(error) {
    logger.error("citySearch: Error occurred", error);
  }

  // Construct response
  const response: CitySearchResponse = {
    queryString,
    results,
  };
  return response;
});
