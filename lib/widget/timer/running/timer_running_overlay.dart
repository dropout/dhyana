import 'package:flutter/material.dart';

class TimerRunningOverlay extends StatelessWidget {

  final bool isEnabled;

  const TimerRunningOverlay({
    required this.isEnabled,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isEnabled == false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1024),
        curve: Curves.fastEaseInToSlowEaseOut,
        width: double.infinity,
        height: double.infinity,
        color: isEnabled ? Colors.black : Colors.transparent,
      ),
    );
  }
}
