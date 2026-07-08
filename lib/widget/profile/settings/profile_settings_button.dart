import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ProfileSettingsButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? helperText;

  const ProfileSettingsButton({
    required this.text,
    required this.onTap,
    this.helperText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          padding: const EdgeInsets.symmetric(
            vertical: DesignSpec.paddingMd,
            horizontal: DesignSpec.paddingXl,
          ),
          onPressed: onTap,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          disabledElevation: 0,
          shape: const StadiumBorder(),
          // fillColor: (onTap == null) ? Color.lerp(bColor, Colors.black, 0.2) : bColor,
          fillColor: AppColors.backgroundPaperLight,
          clipBehavior: Clip.none,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: context.theme.textTheme.titleSmall?.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Gap.small(),
        if (helperText != null) Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingXl),
          child: Text(
            helperText!,
            style: context.theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}