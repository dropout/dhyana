import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/dialog/signout_dialog.dart';
import 'package:dhyana/widget/profile/profile_edit_form.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileWizardScreen extends StatefulWidget {

  final String profileId;

  const ProfileWizardScreen({
    required this.profileId,
    super.key
  });

  @override
  State<ProfileWizardScreen> createState() => _ProfileWizardScreenState();
}

class _ProfileWizardScreenState extends State<ProfileWizardScreen>
  with DefaultScreenSetupHelpersMixin {

  LoadingState formProcessingState = LoadingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
    GlobalKey<FormBuilderState>();

  @override
  void initState() {
    context.read<ProfileCubit>().loadProfile(
      widget.profileId,
    );
    super.initState();
  }

  void _onSave(BuildContext context, Profile profile) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        formProcessingState = LoadingState.loading;
      });
      Map<String, dynamic>? values = formState.value;
      context.read<ProfileCubit>().updateProfile(
        profile: profile,
        formData: values,
        completeProfile: true,
        onComplete: (profile) {
          setState(() {
            formProcessingState = LoadingState.loaded;
          });
        },
        onError: (e, stack) {
          setState(() {
            formProcessingState = LoadingState.idle;
          });
        },
      );
    }
  }

  void _onSignOut(BuildContext context) {
    showAppDialog(context, SignoutDialog());
    context.hapticsTap();
  }

  void _onFormChanged(BuildContext context) {
    setState(() {
      formProcessingState = LoadingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadingState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).profileWizardTitle,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [
                  buildLoadingSliver(context),
                ],
              ),
            );
          case ProfileErrorState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).profileWizardTitle,
                enableTitleSliver: false,
                backgroundColor: Theme.of(context).colorScheme.error,
                appBarBackgroundColor: Theme.of(context).colorScheme.error,
                backButton: CustomBackButton.light(),
                titleColor: Colors.white,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [
                  buildErrorSliver(context),
                ],
              ),
            );
          case ProfileLoadedState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).profileWizardTitle,
                enableScaffolding: false,
                slivers: [

                  // The profile edit form.
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignSpec.paddingLg,
                      ),
                      child: ProfileEditForm(
                        profile: state.profile,
                        formStateKey: formStateKey,
                        onChanged: () => _onFormChanged(context),
                      ),
                    ),
                  ),

                  // Display a sign out button under the edit form
                  // just in case the user cannot continue
                  // with the profile wizard.
                  SliverSafeArea(
                    top: false,
                    sliver: SliverToBoxAdapter(
                      // The layout widgets below are needed to
                      // restrict button size to its content,
                      // otherwise the button would end up
                      // using the whole width.
                      child: SizedBox(
                        height: DesignSpec.spacing4xl,
                        child: Center(
                          child: TextButton(
                            onPressed: () => _onSignOut(context),
                            child: Text(
                              AppLocalizations.of(context).signOut.toUpperCase(),
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ),

                ],
              ),

              // Profile edit form action is not part of the profile
              // edit form, as the form is reused in profile edit screen.
              actionButtonLayer: SafeArea(
                top: false,
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: buildOverlayActionButton(
                    context,
                    state.profile
                  ),
                ),
              )
            );
          default:
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).editProfile,
              enableScrolling: false,
            );
        }
      },
    );
  }

  Widget buildScaffolding(
      BuildContext context,
      Widget contentLayer,
      {Widget? actionButtonLayer}
      ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          contentLayer,
          actionButtonLayer ?? Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingXl),
              child: actionButtonLayer,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOverlayActionButton(BuildContext context, Profile profile) {

    switch (formProcessingState) {
      case LoadingState.idle:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context, profile),
        );
      case LoadingState.loading:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonSaving.toUpperCase(),
        );
      case LoadingState.loaded:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonSaved.toUpperCase(),
          bColor: Colors.green.shade600,
        );
      default:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context, profile),
        );
    }
  }

}
