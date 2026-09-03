import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';

import 'package:profile/l10n/profile_localizations.dart';

import 'package:core/core.dart';
import 'package:profile/src/presentation/view/profile_edit_form.dart';
import 'package:profile/src/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:profile/src/public/model/profile.dart';

class ProfileWizardScreen extends StatefulWidget {
  final String profileId;

  const ProfileWizardScreen({required this.profileId, super.key});

  @override
  State<ProfileWizardScreen> createState() => _ProfileWizardScreenState();
}

class _ProfileWizardScreenState extends State<ProfileWizardScreen>
    with DefaultScreenSetupHelpersMixin {
  ProcessingState formProcessingState = ProcessingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
      GlobalKey<FormBuilderState>();

  void _onSave(BuildContext context, Profile profile) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        formProcessingState = ProcessingState.processing;
      });
      Map<String, dynamic>? values = formState.value;
      context.read<ProfileEditCubit>().updateProfile(
        profile: profile,
        formData: values,
        completeProfile: true,
        onComplete: (profile) {
          setState(() {
            formProcessingState = ProcessingState.completed;
          });
          context.services.hapticsService.success();
        },
        onError: (e, stack) {
          setState(() {
            formProcessingState = ProcessingState.idle;
          });
          context.services.hapticsService.error();
        },
      );
      context.services.hapticsService.tap();
    } else {
      context.services.hapticsService.error();
    }
  }

  void _onSignOut(BuildContext context) {
    showAppDialog(context, SignoutDialog());
    context.hapticsTap();
  }

  void _onFormChanged(BuildContext context) {
    setState(() {
      formProcessingState = ProcessingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartBlocProvider<ProfileEditCubit, ProfileEditState>(
      create: (context) => GetIt.I<ProfileEditCubit>()..loadProfile(widget.profileId),
      builder: (context, state) {
        switch (state) {
          case ProfileEditLoadingState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: ProfileLocalizations.of(context).profileWizardTitle,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [buildLoadingSliver(context)],
              ),
            );
          case ProfileEditErrorState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: ProfileLocalizations.of(context).profileWizardTitle,
                enableTitleSliver: false,
                backgroundColor: Theme.of(context).colorScheme.error,
                appBarBackgroundColor: Theme.of(context).colorScheme.error,
                backButton: CustomBackButton.light(),
                titleColor: Colors.white,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [buildErrorSliver(context)],
              ),
            );
          case ProfileEditLoadedState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: ProfileLocalizations.of(context).profileWizardTitle,
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
                              ProfileLocalizations.of(
                                context,
                              ).signOut.toUpperCase(),
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Profile edit form action is not part of the profile
              // edit form, as the form is reused in profile edit screen.
              actionButtonLayer: SafeArea(
                top: false,
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: buildOverlayActionButton(context, state.profile),
                ),
              ),
            );
          default:
            return DefaultScreenSetup(
              title: ProfileLocalizations.of(context).editProfile,
              enableScrolling: false,
            );
        }
      },
    
    );

    // return BlocBuilder<ProfileEditCubit, ProfileEditState>(
    //   builder: (BuildContext context, ProfileEditState state) {
        
    //   },
    // );
  }

  Widget buildScaffolding(
    BuildContext context,
    Widget contentLayer, {
    Widget? actionButtonLayer,
  }) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          contentLayer,
          actionButtonLayer ??
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignSpec.paddingXl,
                  ),
                  child: actionButtonLayer,
                ),
              ),
        ],
      ),
    );
  }

  Widget buildOverlayActionButton(BuildContext context, Profile profile) {
    switch (formProcessingState) {
      case ProcessingState.idle:
        return AppButton(
          text: context.coreL10n.profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context, profile),
        );
      case ProcessingState.processing:
        return AppButton(
          text: context.coreL10n.profileSaveButtonSaving.toUpperCase(),
        );
      case ProcessingState.completed:
        return AppButton(
          text: context.coreL10n.profileSaveButtonSaved.toUpperCase(),
          bColor: Colors.green.shade600,
        );
      default:
        return AppButton(
          text: context.coreL10n.profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context, profile),
        );
    }
  }
}
