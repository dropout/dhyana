import 'dart:math';

extension AngleConversion on num {
  double toRadians() => this * (pi / 180);
}