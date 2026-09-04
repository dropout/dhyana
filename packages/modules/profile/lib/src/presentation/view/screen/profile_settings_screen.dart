import 'package:profile/l10n/profile_localizations.dart';
import 'package:profile/src/presentation/view/settings/profile_settings_form.dart';

import 'package:core/core.dart';
import 'package:profile/src/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/viewmodel/profile_cubit.dart';

class ProfileSettingsScreen extends StatefulWidget {
  final String profileId;
  final ClearCacheCapability? clearCacheCapability;

  const ProfileSettingsScreen({
    required this.profileId,
    this.clearCacheCapability,
    super.key,
  });

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen>
    with DefaultScreenSetupHelpersMixin, ScreenHelperMixin {
  ProcessingState loadingState = ProcessingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
      GlobalKey<FormBuilderState>();

  void _onSave(BuildContext context, Profile profile) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        loadingState = ProcessingState.processing;
      });
      context.read<ProfileEditCubit>().updateProfileSettings(
        profile: profile,
        settingsFormData: formState.value,
        onComplete: (_) {
          setState(() {
            loadingState = ProcessingState.completed;
          });
        },
        onError: (e, stack) {
          setState(() {
            loadingState = ProcessingState.idle;
          });
        },
      );
    }
  }

  void _onFormChanged(BuildContext context) {
    setState(() {
      loadingState = ProcessingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenTitle = ProfileLocalizations.of(context).profileSettings;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState profileState) {
        switch (profileState) {
          case ProfileLoadingState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: screenTitle,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [buildLoadingSliver(context)],
              ),
            );
          case ProfileLoadedState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: screenTitle,
                enableTitleSliver: true,
                enableScaffolding: false,
                slivers: [
                  SliverSafeArea(
                    top: false,
                    minimum: const EdgeInsets.only(
                      left: DesignSpec.paddingLg,
                      right: DesignSpec.paddingLg,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: ProfileSettingsForm(
                        formStateKey: formStateKey,
                        profile: profileState.profile,
                        profileSettings: profileState.profile.settings,
                        clearCacheCapability: widget.clearCacheCapability,
                        onChanged: () => _onFormChanged(context),
                      ),
                    ),
                  ),
                ],
              ),
              actionButtonLayer: SafeArea(
                top: false,
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: DesignSpec.paddingLg,
                    ),
                    child: buildOverlayActionButton(
                      context,
                      loadingState,
                      onAction: () => _onSave(context, profileState.profile),
                    ),
                  ),
                ),
              ),
            );
          case ProfileStateInitial():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: screenTitle,
                enableScrolling: false,
                enableScaffolding: false,
              ),
            );
          case ProfileErrorState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: screenTitle,
                titleColor: Colors.white,
                enableTitleSliver: false,
                enableScrolling: false,
                enableScaffolding: false,
                backgroundColor: Theme.of(context).colorScheme.error,
                appBarBackgroundColor: Theme.of(context).colorScheme.error,
                backButton: CustomBackButton.light(),
                slivers: [buildErrorSliver(context)],
              ),
            );
        }
      },
    );
  }
}
