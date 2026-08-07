import 'package:flutter/material.dart';

class SoundInputPageViewScrollPhysics extends ScrollPhysics {
  const SoundInputPageViewScrollPhysics({super.parent});

  @override
  SoundInputPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SoundInputPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 1.0,
    stiffness: 500.0,
    damping: 40,
  );
}
