import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class AppStadiumButton extends StatelessWidget {

  final void Function() onTap;
  final String text;
  final Color fColor;
  final Color bColor;

  const AppStadiumButton({
    required this.onTap,
    required this.text,
    this.fColor = Colors.black,
    this.bColor = Colors.white,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              horizontal: AppThemeData.spacingXl,
              vertical: AppThemeData.spacingMd
          ),
          minimumSize: const Size(0, 48.0),
          foregroundColor: fColor,
          backgroundColor: bColor,
          shape: const StadiumBorder()
      ),
      child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 24,
            color: fColor,
            fontWeight: FontWeight.w900,
          )
      ),
    );
  }
}
