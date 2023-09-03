import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppThemeData.spacingMd,
      left: AppThemeData.spacingMd,
      child: GestureDetector(
        onTap: () => GoRouter.of(context).pop(),
        child: Container(
          padding: const EdgeInsets.all(AppThemeData.spacingSm),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        )
      ),
    );
  }
}
