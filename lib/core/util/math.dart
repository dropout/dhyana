import 'dart:math';

extension AngleConversion on num {
  double toRadians() => this * (pi / 180);
  double toDegrees() => this * (180 / pi);
}
