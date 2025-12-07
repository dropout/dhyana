import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileSettingsForm extends StatefulWidget {

  final ProfileSettings profileSettings;
  final VoidCallback? onChanged;
  final GlobalKey<FormBuilderState> formStateKey;

  const ProfileSettingsForm({
    required this.profileSettings,
    required this.formStateKey,
    this.onChanged,
    super.key,
  });

  @override
  State<ProfileSettingsForm> createState() => _ProfileSettingsFormState();

}

class _ProfileSettingsFormState extends State<ProfileSettingsForm> {

  late final GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = widget.formStateKey ?? GlobalKey<FormBuilderState>();
    super.initState();
  }

  void _onFormChanged() {
    widget.onChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formStateKey,
      autovalidateMode: AutovalidateMode.disabled,
      skipDisabled: true,
      onChanged: _onFormChanged,
      child: Column(
        children: [
          Gap.medium(),
          ProfileSettingsSwitch(
            name: 'showTimeOnTimerSettingsScreen',
            title: context.localizations.showTimeOnTimerSettingsScreenTitle,
            helperText: context.localizations.showTimeOnTimerSettingsScreenDescription,
            initialValue: widget.profileSettings.showTimeOnTimerSettingsScreen,
          ),
          Gap.large(),
          ProfileSettingsSwitch(
            name: 'showStatsOnFinishScreen',
            title: context.localizations.showStatsOnFinishScreenTitle,
            helperText: context.localizations.showStatsOnFinishScreenDescription,
            initialValue: widget.profileSettings.showStatsOnFinishScreen,
          ),
          Gap.large(),
          ProfileSettingsSwitch(
            name: 'usePresenceFeature',
            title: context.localizations.usePresenceFeatureTitle,
            helperText: context.localizations.usePresenceFeatureDescription,
            initialValue: widget.profileSettings.usePresenceFeature,
          ),
        ],
      ),
    );
  }



}

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
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.backgroundPaperLight,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppThemeData.paddingXl,
            ),
            child: Wrap(
              children: [
                FormBuilderSwitch(
                  name: name,
                  title: Text(title),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    helperStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                  initialValue: initialValue,
                  onChanged: onChanged,
                ),
              ],
            ),
          )
        ),
        Gap.small(),
        if (helperText != null) Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.paddingXl,
          ),
          child: Text(
            helperText!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
