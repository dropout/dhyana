import 'package:profile/l10n/profile_localizations.dart';
import 'package:profile/src/presentation/view/settings/profile_settings_health_connect.dart';
import 'package:profile/src/presentation/view/settings/profile_settings_clear_cache.dart';
import 'package:profile/src/presentation/view/settings/profile_settings_switch.dart';
import 'package:core/core.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_settings.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileSettingsForm extends StatefulWidget {
  final Profile profile;
  final ProfileSettings profileSettings;
  final ClearCacheCapability? clearCacheCapability;
  final VoidCallback? onChanged;
  final GlobalKey<FormBuilderState> formStateKey;

  const ProfileSettingsForm({
    required this.profile,
    required this.profileSettings,
    required this.formStateKey,
    this.clearCacheCapability,
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
    showAppDialog(context, DeleteProfileDialog(profileId: widget.profile.id));
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
            title: ProfileLocalizations.of(context).showStatsOnFinishScreenTitle,
            helperText: ProfileLocalizations.of(context).showStatsOnFinishScreenDescription,
            initialValue: widget.profileSettings.showStatsOnFinishScreen,
          ),
          Gap.large(),
          ProfileSettingsSwitch(
            name: 'usePresenceFeature',
            title: ProfileLocalizations.of(context).usePresenceFeatureTitle,
            helperText: ProfileLocalizations.of(context).usePresenceFeatureDescription,
            initialValue: widget.profileSettings.usePresenceFeature,
          ),
          Gap.large(),
          ProfileSettingsHealthConnect(
            mindfulMinutesService: context.services.mindfulMinutesService,
          ),
          Gap.large(),
          if (widget.clearCacheCapability != null)
            ProfileSettingsClearCache(
              clearCacheCapability: widget.clearCacheCapability!,
            ),
          Gap.large(),
          AppButton.small(
            fColor: Colors.black,
            bColor: Colors.transparent,
            text: context.coreL10n.profileDeleteTitle.toUpperCase(),
            onTap: () => _onDeleteProfileTapped(context),
          ),
        ],
      ),
    );
  }
}
