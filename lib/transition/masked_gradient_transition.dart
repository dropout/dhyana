import 'package:dhyana/painting/gradient_translate.dart';
import 'package:flutter/material.dart';

class MaskedGradientTransition extends AnimatedWidget {

  final Animation<double> progress;
  final Widget? child;

  const MaskedGradientTransition({
    required this.progress,
    this.child,
    super.key,
  }) : super(listenable: progress);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: ShaderMask(
        shaderCallback: (rect) {
          double gradientTop = rect.height - (rect.height * 2) * progress.value;
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Colors.transparent, Colors.white],
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
            transform: GradientTranslate(0, gradientTop),
          ).createShader(rect);
        },
        child: child,
      ),
    );
  }

}
