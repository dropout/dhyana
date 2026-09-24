import 'package:core/core.dart';

import 'package:profile/l10n/profile_localizations.dart';
import 'package:get_it/get_it.dart';

import 'package:profile/src/presentation/view/profile_edit_form.dart';
import 'package:profile/src/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:profile/src/public/model/profile.dart';

class const ProfileEditScreen({required final String profileId, super.key})
    extends StatefulWidget {
  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen>
    with DefaultScreenSetupHelpersMixin {
  ProcessingState state = ProcessingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
      GlobalKey<FormBuilderState>();
  void _onSave(BuildContext context, Profile profile) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        state = ProcessingState.processing;
      });
      Map<String, dynamic>? values = formState.value;
      context.read<ProfileEditCubit>().updateProfile(
        profile: profile,
        formData: values,
        onComplete: (profile) {
          setState(() {
            state = ProcessingState.completed;
          });
          context.services.hapticsService.success();
        },
        onError: (e, stack) {
          setState(() {
            state = ProcessingState.idle;
          });
          context.services.hapticsService.error();
        },
      );
      context.services.hapticsService.tap();
    } else {
      context.services.hapticsService.error();
    }
  }

  void _onFormChanged(BuildContext context) {
    setState(() {
      state = ProcessingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartBlocProvider<ProfileEditCubit, ProfileEditState>(
      create: (context) =>
          GetIt.I<ProfileEditCubit>()..loadProfile(widget.profileId),
      builder: (BuildContext context, ProfileEditState state) {
        switch (state) {
          case ProfileEditLoadingState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: ProfileLocalizations.of(context).editProfile,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [buildLoadingSliver(context)],
              ),
            );
          case ProfileEditErrorState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: ProfileLocalizations.of(context).editProfile,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [buildErrorSliver(context)],
              ),
            );
          case ProfileEditLoadedState():
            return DefaultScreenSetup(
              title: ProfileLocalizations.of(context).editProfile,
              enableAppBarSliver: false,
              overlay: SafeArea(
                top: false,
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: buildOverlayActionButton(context, state.profile),
                ),
              ),
              slivers: [
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
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
                ),
              ],
            );
          default:
            return DefaultScreenSetup(
              title: ProfileLocalizations.of(context).editProfile,
              enableScrolling: false,
            );
        }
      },
    );
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
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return AnimatedOpacity(
      duration: isKeyboardOpen ? Duration.zero : Durations.short4,
      opacity: isKeyboardOpen ? 0.0 : 1.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: DesignSpec.spacingLg),
        child: switch (state) {
          .idle => AppButton.large(
            text: context.coreL10n.profileSaveButtonIdle.toUpperCase(),
            onTap: () => _onSave(context, profile),
          ),
          .processing => AppButton.large(
            text: context.coreL10n.profileSaveButtonSaving.toUpperCase(),
          ),
          .completed => AppButton.large(
            text: context.coreL10n.profileSaveButtonSaved.toUpperCase(),
            bColor: Colors.green.shade600,
          ),
          .error => AppButton.large(
            text: context.coreL10n.profileSaveButtonIdle.toUpperCase(),
            onTap: () => _onSave(context, profile),
          ),
        },
      ),
    );

  }

}
