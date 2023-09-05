import 'package:flutter/material.dart';

Iterable<Widget> _intersperseWidgets(Widget widget, Iterable<Widget> iterable) sync* {
  yield* _intersperse<Widget>(widget, iterable);
}

Iterable<T> _intersperse<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}

extension IntersperseList on List<Widget> {

  List<Widget> intersperse(Widget spacer) {
    return _intersperseWidgets(spacer, this).toList();
  }

}
