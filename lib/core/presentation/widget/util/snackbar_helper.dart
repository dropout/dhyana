

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
          content: Row(
            children: [
              const Icon(Icons.check_circle,
                color: Colors.white
              ),
              Gap.small(),
              Text(message),
            ],
           ),
          duration: const Duration(seconds: 2),
        ),
      );
  }

}

