import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import 'profile_edit_form.dart';

class ProfileEditView extends StatefulWidget {

  final Profile profile;

  const ProfileEditView({
    required this.profile,
    super.key
  });

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {

  LoadingState state = LoadingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
    GlobalKey<FormBuilderState>();

  void _onSave(BuildContext context) {
    setState(() {
      state = LoadingState.loading;
    });
    Profile profile = widget.profile;
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      Map<String, dynamic>? values = formState.value;
      BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.updateProfile(
        profile: profile,
        formData: values,
        onComplete: (profile) {
          setState(() {
            state = LoadingState.updated;
          });
        },
        onError: (e, stack) {
          setState(() {
            state = LoadingState.idle;
          });
        },
      ));
    }
    context.hapticsTap();
  }

  void onSignOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signOut());
    context.pop();
  }

  void onFormChanged(BuildContext context) {
    setState(() {
      state = LoadingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppThemeData.paddingXl,
              right: AppThemeData.paddingXl,
              top: AppThemeData.spacingLg,
            ),
            child: ProfileEditForm(
              profile: widget.profile,
              formStateKey: formStateKey,
              onChanged: () => onFormChanged(context),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.0, 1.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingXl),
            child: buildActionButton(context),
          ),
        ),
      ],
    );
  }
  
  Widget buildActionButton(BuildContext context) {
    switch (state) {
      case LoadingState.idle:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context),
        );
      case LoadingState.loading:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonSaving.toUpperCase(),
        );
      case LoadingState.updated:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonSaved.toUpperCase(),
          bColor: Colors.green.shade600,
        );
    }
  }
}
