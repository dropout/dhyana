import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/dialog/delete_profile_dialog.dart';
import 'package:dhyana/widget/input/form_builder_duration_input.dart';
import 'package:dhyana/widget/profile/settings/profile_settings_health_connect.dart';
import 'package:dhyana/widget/profile/settings/profile_settings_switch.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/dialog_helper.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileSettingsForm extends StatefulWidget {
  final Profile profile;
  final ProfileSettings profileSettings;
  final VoidCallback? onChanged;
  final GlobalKey<FormBuilderState> formStateKey;

  const ProfileSettingsForm({
    required this.profile,
    required this.profileSettings,
    required this.formStateKey,
    this.onChanged,
    super.key,
  });

  @override
  State<ProfileSettingsForm> createState() => _ProfileSettingsFormState();
}

class _ProfileSettingsFormState extends State<ProfileSettingsForm> {
  @override
  void initState() {
    super.initState();
  }

  void _onFormChanged() {
    widget.onChanged?.call();
  }
  
  void _onDeleteProfileTapped(BuildContext context) {
    showAppDialog(context, DeleteProfileDialog());
    context.hapticsTap();
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
            ProfileSettingsHealthConnect(
              mindfulMinutesService: context.services.mindfulMinutesService,
            ),
            Gap.large(),
            ProfileSettingsSwitch(
              name: 'showStatsOnFinishScreen',
              title: context.l10n.showStatsOnFinishScreenTitle,
              helperText: context.l10n.showStatsOnFinishScreenDescription,
              initialValue: widget.profileSettings.showStatsOnFinishScreen,
            ),
            Gap.large(),
            ProfileSettingsSwitch(
              name: 'usePresenceFeature',
              title: context.l10n.usePresenceFeatureTitle,
              helperText: context.l10n.usePresenceFeatureDescription,
              initialValue: widget.profileSettings.usePresenceFeature,
            ),
            Gap.large(),
            AppButton.small(
              fColor: Colors.black,
              bColor: Colors.transparent,
              text: context.l10n.profileDeleteTitle.toUpperCase(),
              onTap: () => _onDeleteProfileTapped(context),
            ),
          ],
      ),
    );
  }
}

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
