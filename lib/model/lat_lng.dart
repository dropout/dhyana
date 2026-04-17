import 'dart:math';

import 'package:dhyana/util/math.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lat_lng.freezed.dart';
part 'lat_lng.g.dart';

@freezed
sealed class LatLng with _$LatLng {

  const LatLng._();

  const factory LatLng({
    required double latitude,
    required double longitude,
  }) = _LatLng;

  factory LatLng.fromJson(Map<String, dynamic> json) =>
    _$LatLngFromJson(json);

  double distanceTo(LatLng other) {
    // Haversine formula to calculate distance between two points on the Earth
    const double earthRadiusKm = 6371.0;

    double dLat = (other.latitude - latitude).toRadians();
    double dLon = (other.longitude - longitude).toRadians();

    double a = 
        (sin(dLat / 2) * sin(dLat / 2)) +
        cos((latitude).toRadians()) *
        cos((other.latitude).toRadians()) *
        (sin(dLon / 2) * sin(dLon / 2));

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadiusKm * c;
  }

}
