import 'package:dhyana/model/city_search_result.dart';

abstract interface class FunctionsService {

  const FunctionsService();

  Future<List<CitySearchResult>> citySearch({
    required String queryString,
  });

  Future<CitySearchResult> getCityLocation({
    required CitySearchResult citySearchResult,
  });

}
