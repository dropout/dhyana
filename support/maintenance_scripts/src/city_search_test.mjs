import {PlacesClient} from "@googlemaps/places";

const apiKey = process.env.GOOGLE_MAPS_API_KEY;
if (!apiKey) {
  throw new Error("GOOGLE_MAPS_API_KEY environment variable is not set.");
}


// Test function to call Places Autocomplete and Place Details
// for a sample text input.
//
// This requires two queries to get the location that we aiming for:
// 1. Autocomplete to get place predictions
// 2. Place Details to get detailed info about a selected place like location
async function autoCompletePlacesTest() {
  const placesClient = new PlacesClient({
    apiKey: apiKey,
  });

  const response = await placesClient.autocompletePlaces({
    input: "Bud",
    includedPrimaryTypes: ["locality"],
  });

  const result = response[0];
  const suggestions = result.suggestions;

  console.log(response);

  for (const suggestion of suggestions) {
    console.log(suggestion);
  }



  // const firstPrediction = suggestions[0].placePrediction;
  // const placeId = firstPrediction.placeId;
  // const place = firstPrediction.place;
  // const name = firstPrediction.structuredFormat.mainText.text;

//     console.log(firstPrediction.text.matches);
//     console.log(firstPrediction.structuredFormat.mainText);
//     console.log(firstPrediction.structuredFormat.secondaryText);

    // const callOptions = {
    //   otherArgs: {
    //     headers: {
    //       'X-Goog-FieldMask': "displayName,formattedAddress,location",
    //     },
    //   },
    // };

    // // console.log(firstPrediction);
    // // console.log(`Place ID: ${placeId}`);
    // // console.log(`Name: ${name}`);

    // const placeDetailsResponse = await placesClient.getPlace({
    //   name: place,
    // }, callOptions);

    // // console.log(placeDetailsResponse);

}

// Test search text api to test if it returns
// the expected results. City name and location in one request.
// This is preferable to the city selector ui.
// !!! This isn't good for an autocomplete experience,
// since it fails to return results for query: "Bud" for ex.
// It only returns results for more complete queries like "Szege" -> "Szeged".
async function searchTextTest() {
  const placesClient = new PlacesClient({
    apiKey: apiKey,
  });

  const callOptions = {
    otherArgs: {
      headers: {
        'X-Goog-FieldMask': "places.displayName,places.location",
      },
    },
  };

  const response = await placesClient.searchText({
    textQuery: "Szege",
    includedType: "locality",
    maxResultCount: 10,
    strictTypeFiltering: true,
  }, callOptions);

  console.log(response);

  const places = response[0].places;

  console.log(places);

}

autoCompletePlacesTest();

// autocomplete response example:
// {
//   types: [ 'political', 'geocode', 'locality' ],
//   place: 'places/ChIJyc_U0TTDQUcRYBEeDCnEAAQ',
//   placeId: 'ChIJyc_U0TTDQUcRYBEeDCnEAAQ',
//   text: { matches: [ [Object] ], text: 'Budapest, Hungary' },
//   structuredFormat: {
//     mainText: { matches: [Array], text: 'Budapest' },
//     secondaryText: { matches: [], text: 'Hungary' }
//   },
//   distanceMeters: 0
// }

// place details response example:
// [
//   {
//     types: [],
//     addressComponents: [],
//     attributions: [],
//     currentSecondaryOpeningHours: [],
//     regularSecondaryOpeningHours: [],
//     reviews: [],
//     photos: [],
//     subDestinations: [],
//     containingPlaces: [],
//     name: '',
//     id: '',
//     nationalPhoneNumber: '',
//     internationalPhoneNumber: '',
//     formattedAddress: 'Budapest, Hungary',
//     plusCode: null,
//     location: { latitude: 47.497912, longitude: 19.040235 },
//     viewport: null,
//     rating: 0,
//     googleMapsUri: '',
//     websiteUri: '',
//     regularOpeningHours: null,
//     adrFormatAddress: '',
//     businessStatus: 'BUSINESS_STATUS_UNSPECIFIED',
//     priceLevel: 'PRICE_LEVEL_UNSPECIFIED',
//     iconMaskBaseUri: '',
//     iconBackgroundColor: '',
//     displayName: { text: 'Budapest', languageCode: 'en' },
//     primaryTypeDisplayName: null,
//     currentOpeningHours: null,
//     primaryType: '',
//     shortFormattedAddress: '',
//     editorialSummary: null,
//     paymentOptions: null,
//     parkingOptions: null,
//     fuelOptions: null,
//     evChargeOptions: null,
//     generativeSummary: null,
//     addressDescriptor: null,
//     priceRange: null,
//     reviewSummary: null,
//     timeZone: null,
//     evChargeAmenitySummary: null,
//     postalAddress: null,
//     neighborhoodSummary: null,
//     consumerAlert: null,
//     movedPlace: '',
//     movedPlaceId: ''
//   },
//   null,
//   null
//   }
// ]


// searchText response example
// {
//   types: [],
//   addressComponents: [],
//   attributions: [],
//   currentSecondaryOpeningHours: [],
//   regularSecondaryOpeningHours: [],
//   reviews: [],
//   photos: [],
//   subDestinations: [],
//   containingPlaces: [],
//   name: '',
//   id: '',
//   nationalPhoneNumber: '',
//   internationalPhoneNumber: '',
//   formattedAddress: '',
//   plusCode: null,
//   location: { latitude: 46.2530102, longitude: 20.141425299999998 },
//   viewport: null,
//   rating: 0,
//   googleMapsUri: '',
//   websiteUri: '',
//   regularOpeningHours: null,
//   adrFormatAddress: '',
//   businessStatus: 'BUSINESS_STATUS_UNSPECIFIED',
//   priceLevel: 'PRICE_LEVEL_UNSPECIFIED',
//   iconMaskBaseUri: '',
//   iconBackgroundColor: '',
//   displayName: { text: 'Szeged', languageCode: 'en' },
//   primaryTypeDisplayName: null,
//   currentOpeningHours: null,
//   primaryType: '',
//   shortFormattedAddress: '',
//   editorialSummary: null,
//   paymentOptions: null,
//   parkingOptions: null,
//   fuelOptions: null,
//   evChargeOptions: null,
//   generativeSummary: null,
//   addressDescriptor: null,
//   priceRange: null,
//   reviewSummary: null,
//   timeZone: null,
//   evChargeAmenitySummary: null,
//   postalAddress: null,
//   neighborhoodSummary: null,
//   consumerAlert: null,
//   movedPlace: '',
//   movedPlaceId: ''
// }
