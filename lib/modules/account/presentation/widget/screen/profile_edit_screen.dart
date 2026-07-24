import 'package:dhyana/core/domain/enum/loading_state.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/modules/account/presentation/widget/profile_edit_form.dart';
import 'package:dhyana/core/presentation/default_screen_setup.dart';
import 'package:dhyana/core/presentation/widget/util/app_button.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/presentation/bloc/profile/profile_cubit.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen>
    with DefaultScreenSetupHelpersMixin {
  
  LoadingState state = LoadingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
      GlobalKey<FormBuilderState>();

  void _onSave(BuildContext context, Profile profile) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        state = LoadingState.loading;
      });
      Map<String, dynamic>? values = formState.value;
      context.read<ProfileCubit>().updateProfile(
        profile: profile,
        formData: values,
        onComplete: (profile) {
          setState(() {
            state = LoadingState.loaded;
          });
          context.services.hapticsService.success();
        },
        onError: (e, stack) {
          setState(() {
            state = LoadingState.idle;
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
      state = LoadingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state) {
          case ProfileLoadingState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).editProfile,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [buildLoadingSliver(context)],
              ),
            );
          case ProfileErrorState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).editProfile,
                enableScrolling: false,
                enableScaffolding: false,
                slivers: [buildErrorSliver(context)],
              ),
            );
          case ProfileLoadedState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).editProfile,
                enableScaffolding: false,
                slivers: [
                  SliverSafeArea(
                    top: false,
                    sliver: SliverToBoxAdapter(
                      // child: ProfileEditView(profile: state.profile),
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
              ),
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
              title: AppLocalizations.of(context).editProfile,
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
    switch (state) {
      case LoadingState.idle:
        return AppButton(
          text: AppLocalizations.of(
            context,
          ).profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context, profile),
        );
      case LoadingState.loading:
        return AppButton(
          text: AppLocalizations.of(
            context,
          ).profileSaveButtonSaving.toUpperCase(),
        );
      case LoadingState.loaded:
        return AppButton(
          text: AppLocalizations.of(
            context,
          ).profileSaveButtonSaved.toUpperCase(),
          bColor: Colors.green.shade600,
        );
      case LoadingState.error:
        return AppButton(
          text: AppLocalizations.of(
            context,
          ).profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context, profile),
        );
    }
  }
}
