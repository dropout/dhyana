import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Curve _curve = Curves.easeOut;
int _interval = 32;
int _duration = 640;

extension RevealListAnimation on List<Widget> {

  List<Widget> revealListAnimation({
    double delay = 0.0,
  }) {
    return animate(
      delay: delay.ms,
      interval: _interval.ms,
    ).fadeIn(
      curve: _curve,
      duration: _duration.ms
    );
  }
}

extension RevealWidgetAnimation on Widget {

  Widget reveal(int order) {
    return animate(
      delay: Duration(milliseconds: order * _interval),
    ).fadeIn(
      curve: _curve,
      duration: _duration.ms
    );

  }

  Widget loadingReveal() {
    return animate().fadeIn(
      delay: const Duration(milliseconds: 256),
      duration: const Duration(milliseconds: 512),
    );
  }

}
