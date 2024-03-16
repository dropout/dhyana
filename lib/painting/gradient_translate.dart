import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GradientTranslate extends GradientTransform {

  final double x;
  final double y;

  const GradientTranslate(
      this.x,
      this.y
      );

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.identity()
      ..translate(x, y);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is GradientTranslate
        && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode + y.hashCode;

  @override
  String toString() {
    return '${objectRuntimeType(this, 'GradientTranslation')}(x: ${debugFormatDouble(x)} y: ${debugFormatDouble(y)})';
  }
}
