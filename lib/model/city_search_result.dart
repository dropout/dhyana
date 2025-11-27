import 'package:dhyana/model/lat_lng.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_search_result.freezed.dart';
part 'city_search_result.g.dart';

@freezed
sealed class CitySearchResult with _$CitySearchResult {
  const factory CitySearchResult({
    required String placeId,
    required String name,
    required List<String> types,
    LatLng? location,
  }) = _CitySearchResult;

  factory CitySearchResult.fromJson(Map<String, dynamic> json) =>
      _$CitySearchResultFromJson(json);
}
