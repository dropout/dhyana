import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_settings_form.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:dhyana/widget/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'default_screen_setup.dart';

class ProfileSettingsScreen extends StatefulWidget {

  final String profileId;

  const ProfileSettingsScreen({
  required this.profileId,
  super.key
  });

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen>
  with DefaultScreenSetupHelpersMixin, ScreenHelperMixin {

  LoadingState loadingState = LoadingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
    GlobalKey<FormBuilderState>();

  void _onSave(BuildContext context, Profile profile) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        loadingState = LoadingState.loading;
      });
      context.read<ProfileCubit>().updateProfileSettings(
        profile: profile,
        settingsFormData: formState.value,
        onComplete: (_) {
          setState(() {
            loadingState = LoadingState.loaded;
          });
        },
        onError: (e, stack) {
          setState(() {
            loadingState = LoadingState.idle;
          });
        },
      );
    }
  }

  void _onFormChanged(BuildContext context) {
    print('Form changed');
    setState(() {
      loadingState = LoadingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenTitle = context.localizations.profileSettings;
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
                slivers: [
                  buildLoadingSliver(context),
                ],
              )
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
                      left: AppThemeData.paddingLg,
                      right: AppThemeData.paddingLg,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: ProfileSettingsForm(
                        formStateKey: formStateKey,
                        profile: profileState.profile,
                        profileSettings: profileState.settings,
                        onChanged: () => _onFormChanged(context),
                      ),
                    ),
                  )
                ],
              ),
              actionButtonLayer: SafeArea(
                top: false,
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: buildOverlayActionButton(
                    context,
                    loadingState,
                    onAction: () => _onSave(context, profileState.profile),
                  ),
                ),
              )
            );
          case ProfileStateInitial():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: screenTitle,
                enableScrolling: false,
                enableScaffolding: false,
              )
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
                slivers: [
                  buildErrorSliver(context),
                ],
              ),
            );
        }
      },
    );


  }

}
