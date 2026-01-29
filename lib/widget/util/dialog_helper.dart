import 'package:flutter/material.dart';

void showAppDialog(BuildContext context, Widget dialog) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return dialog;
    },
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    barrierLabel: '',
    transitionDuration: Durations.medium4,
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedAnimation = CurvedAnimation(
        parent: anim1,
        curve: Curves.easeInOutBack,
      );
      return ScaleTransition(
        scale: curvedAnimation,
        child: Opacity(
          opacity: curvedAnimation.value.clamp(0.0, 1.0),
          child: child,
        ),
      );
    },
  );
}
