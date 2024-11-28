

import 'package:flutter/material.dart';

import 'gap.dart';

extension SnackBarMixin on BuildContext {

  Future<void> showSuccessfulSnackBar(String message) async {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.green,
          // behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(Icons.check_circle,
                color: Colors.white
              ),
              Gap.small(),
              Text(message),
            ],
           ),
          duration: const Duration(seconds: 2),
        ),

        // _SuccessfulSnackBar(
        //   title: 'Success',
        //   body: message,
        // ),
        // snackBarAnimationStyle: ,
      );
  }

}

class _SuccessfulSnackBar extends SnackBar {

  final String title;
  final String body;

  _SuccessfulSnackBar({
    required this.title,
    required this.body,
    super.key,
  }) : super(
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    content: Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold)
            ),
            Text(body),
          ],
        );
      }),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
  );
}
