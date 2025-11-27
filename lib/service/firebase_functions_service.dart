import 'package:cloud_functions/cloud_functions.dart';
import 'package:dhyana/model/city_search_result.dart';

import 'functions_service.dart';

class FirebaseFunctionsService extends FunctionsService {

  final FirebaseFunctions fbFunctions;

  const FirebaseFunctionsService({
    required this.fbFunctions,
  });

  // Because the search result in this call
  // doesn't contain nested location object,
  // a normal parsing works here.
  @override
  Future<List<CitySearchResult>> citySearch({required String queryString}) async {
    final HttpsCallableResult<Map<String, dynamic>> callableResult = await fbFunctions
      .httpsCallable('call-citysearch', options: HttpsCallableOptions())
      .call(<String, dynamic>{'queryString': queryString});

    // Expected to be a json in the result's data field
    final Map<String, dynamic> data = callableResult.data;

    // The json response is expected to have a 'results' field
    // that contains the list of CitySearchResult json objects
    late final List<dynamic> rawList;
    try {
      rawList = data ['results'] as List;
    } catch (e) {
      throw Exception('Invalid response format from searchCities function: expected List but got ${data['results'].runtimeType}');
    }

    return rawList.map((item) => CitySearchResult.fromJson(
      Map<String, dynamic>.from(item as Map),
    )).toList();
  }

  // Some weird parsing need to happen because of the dynamic nature of callable results
  // It contains Map<Object?, Object?> which is not directly compatible with Map<String, dynamic>
  // and fails to parse nested objects directly.
  @override
  Future<CitySearchResult> getCityLocation({required CitySearchResult citySearchResult}) async {
    final HttpsCallableResult<Map<String, dynamic>> callableResult = await fbFunctions
      .httpsCallable('call-getcitylocation', options: HttpsCallableOptions())
      .call(<String, dynamic>{'citySearchResult': citySearchResult.toJson()});

    // Expected to be a json in the result's data field
    final Map<String, dynamic> data = callableResult.data;

    // The json response is expected to have a 'result' field
    // that contains the CitySearchResult
    try {
      data['result'] = Map<String, dynamic>.from(data['result'] as Map);
    } catch (e) {
      throw Exception('CallableResults\'s result field is not a json map: $e');
    }

    // The CitySearchResult's location field is expected to be
    // a json representation of LatLng
    try {
      data['result']['location'] = Map<String, dynamic>.from(data['result']['location'] as Map);
    } catch (e) {
      throw Exception('Result json does not have a location field that is a json map: $e');
    }

    // Actually parse the CitySearchResult
    // without runtime errors trying to convert Map<Object?, Object?> to Map<String, dynamic>
    return CitySearchResult.fromJson(data['result']);
  }

}
