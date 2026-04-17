import 'dart:math';

import 'package:dhyana/model/lat_lng.dart';

/// Calculates the bounding box for a given center point and distance in kilometers.
(LatLng, LatLng) calculateBoundingBox(LatLng center, double distanceInKm) {
  const earthRadiusKm = 6371.0;

  final latDeltaDegrees = (distanceInKm / earthRadiusKm) * (180 / pi);
  final lngDeltaDegrees = latDeltaDegrees / cos(center.latitude * pi / 180);

  final minLat = center.latitude - latDeltaDegrees;
  final maxLat = center.latitude + latDeltaDegrees;
  final minLng = center.longitude - lngDeltaDegrees;
  final maxLng = center.longitude + lngDeltaDegrees;

  return (
    LatLng(latitude: minLat, longitude: minLng), 
    LatLng(latitude: maxLat, longitude: maxLng)
  );
}