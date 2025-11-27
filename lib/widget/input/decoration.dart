import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

InputDecoration getTextInputDecoration(BuildContext context) {

  final border = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.backgroundPaperLight,
      width: 2.0,
    ),
  );

  return InputDecoration(
    constraints: BoxConstraints
      .tightFor(height: AppThemeData.inputHeight),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    alignLabelWithHint: true,
    border: border,
    enabledBorder: border, // mute enabled border color change
    focusedBorder: border, // mute focus border color change
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.5),
        width: 2.0,
      ),
    ),
    fillColor: AppColors.backgroundPaperLight,
    filled: true,
    contentPadding: EdgeInsets.symmetric(
      horizontal: AppThemeData.paddingSm,
      vertical: AppThemeData.paddingSm,
    ),
  );
}
