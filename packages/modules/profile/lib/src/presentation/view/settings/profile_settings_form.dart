import 'package:profile/src/presentation/view/settings/profile_settings_health_connect.dart';
import 'package:profile/src/presentation/view/settings/profile_settings_switch.dart';
import 'package:core/core.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_settings.dart';
import 'package:material_ui/material_ui.dart';
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
          ProfileSettingsHealthConnect(
            mindfulMinutesService: context.services.mindfulMinutesService,
          ),
          Gap.large(),
          // TODO: Re-enable this once we have a proper cache clearing mechanism in place
          // ProfileSettingsClearCache(
          //   chantPlaybackRepository: context.repos.chantPlaybackRepository,
          // ),
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

