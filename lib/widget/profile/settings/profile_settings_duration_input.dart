import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/input/form_builder_duration_input.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ProfileSettingsDurationInput extends StatelessWidget {
  final String title;
  final String name;
  final String? helperText;
  final Duration initialValue;
  final ValueChanged<Duration?>? onChanged;

  const ProfileSettingsDurationInput({
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
      crossAxisAlignment: .stretch,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.backgroundPaperLight,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpec.paddingXl,
            ),
            child: FormBuilderDurationInput(
              name: name,
              label: title,
              initialValue: initialValue,
              onChanged: onChanged,
              valueTransformer: (value) => value?.inSeconds ?? 0,
            ),
          ),
        ),
        Gap.small(),
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpec.paddingXl,
            ),
            child: Text(helperText!, style: context.theme.textTheme.bodyMedium),
          ),
      ],
    );
  }
}