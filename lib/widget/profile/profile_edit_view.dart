import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import 'profile_edit_form.dart';

enum _State {
  idle,
  loading,
  updated,
}

class ProfileEditView extends StatefulWidget {

  final Profile profile;
  final GlobalKey<FormBuilderState> formStateKey =
    GlobalKey<FormBuilderState>();

  ProfileEditView({
    required this.profile,
    super.key
  });

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {

  _State state = _State.idle;

  void onSave(BuildContext context) {
    setState(() {
      state = _State.loading;
    });
    Profile profile = widget.profile;
    FormBuilderState? formState = widget.formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      Map<String, dynamic>? values = formState.value;
      BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.updateProfile(
        profile: profile,
        formData: values,
        onComplete: (profile) {
          setState(() {
            state = _State.updated;
          });
        },
        onError: (e, stack) {

          setState(() {
            state = _State.idle;
          });
        },
      ));
    }
  }

  void onSignOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signOut());
    context.pop();
  }

  void onFormChanged(BuildContext context) {
    setState(() {
      state = _State.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              children: [
                ProfileEditForm(
                  profile: widget.profile,
                  formStateKey: widget.formStateKey,
                  onChanged: () => onFormChanged(context),
                ),
              ],
            )
          ),
          Column(
            children: [
              buildActionButton(context),
            ],
          )
        ],
      ),
    );
  }
  
  Widget buildActionButton(BuildContext context) {
    switch (state) {
      case _State.idle:
        return AppButton(
          text: 'SAVE',
          onTap: () => onSave(context),
        );
      case _State.loading:
        return const AppButton(
          text: 'SAVING...',
        );
      case _State.updated:
        return AppButton(
          text: 'SAVED!',
          bColor: Colors.green.shade600,
        );
    }
  }
}
