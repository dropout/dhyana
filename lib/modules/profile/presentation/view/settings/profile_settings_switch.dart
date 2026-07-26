import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:dhyana/core/presentation/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileSettingsSwitch extends StatelessWidget {

  final String title;
  final String name;
  final String? helperText;
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;

  const ProfileSettingsSwitch({
    required this.title,
    required this.name,
    required this.initialValue,
    this.helperText,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            // color: AppColors.backgroundPaperLight,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              // horizontal: DesignSpec.paddingXl,
            ),
            child: Wrap(
              children: [
                FormBuilderSwitch(
                  name: name,
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: DesignSpec.paddingXl,
                      vertical: DesignSpec.paddingLg,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    
                    fillColor: AppColors.backgroundPaperLight,
                    filled: true,
                    helperStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                  initialValue: initialValue,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
        Gap.small(),
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpec.paddingXl,
            ),
            child: Text(
              helperText!,
              style: context.theme.textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }
}