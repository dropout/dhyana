import 'package:flutter/material.dart';
import 'package:dhyana/widgets/app_theme_data.dart';

class AppButton extends StatelessWidget {

  final String text;
  final Color? fColor;
  final Color? bColor;
  final void Function()? onTap;
  
  const AppButton({
    required this.text,
    this.fColor,
    this.bColor,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap?.call(),
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 48.0),
        foregroundColor: fColor,
        backgroundColor: bColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(AppThemeData.borderRadiusMd)
            )
        ),
      ),
      child: Text(text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        )
      ),
    );
  }
}
