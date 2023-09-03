

import 'package:flutter/material.dart';

Iterable<Widget> intersperseWidgets(Widget widget, Iterable<Widget> iterable) sync* {
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