import 'package:flutter/material.dart';

class SoundInputPageViewScrollPhysics extends ScrollPhysics {
  const SoundInputPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  SoundInputPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SoundInputPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 50,
    stiffness: 100,
    damping: 0.8,
  );
}