import 'package:freezed_annotation/freezed_annotation.dart';

import 'lat_lng.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
sealed class Location with _$Location {
  const factory Location({
    required String name,
    required LatLng latLng,
    required String geoHash,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
    _$LocationFromJson(json);
}
