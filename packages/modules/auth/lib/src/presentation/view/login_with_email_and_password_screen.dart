import 'package:core/core.dart';
import 'package:dhyana/modules/profile/profile_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:dhyana/l10n/app_localizations.dart';

import 'package:auth/src/presentation/view/login_with_email_and_password/login_with_email_and_password_form.dart';

class LoginWithEmailAndPasswordScreen extends StatefulWidget {
  const LoginWithEmailAndPasswordScreen({super.key});

  @override
  State<LoginWithEmailAndPasswordScreen> createState() =>
      _LoginWithEmailAndPasswordScreenState();
}

class _LoginWithEmailAndPasswordScreenState
    extends State<LoginWithEmailAndPasswordScreen> {
  ProcessingState state = ProcessingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
      GlobalKey<FormBuilderState>();

  void _onSigninTap(BuildContext context) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        state = ProcessingState.processing;
      });
      Map<String, dynamic>? values = formState.value;
      final email = values['email'] as String;
      final password = values['password'] as String;
      context.read<AuthCubit>().signInWithEmailAndPassword(
        email: email,
        password: password,
        onComplete: (userId) {
          ProfileRoute(profileId: userId).go(context);
        },
      );
    }
  }

  void _onSignupTap(BuildContext context) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      Map<String, dynamic>? values = formState.value;
      final email = values['email'] as String;
      final password = values['password'] as String;    
      context.read<AuthCubit>().signupWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
  }

  void _onFormChanged(BuildContext context) {
    setState(() {
      state = ProcessingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreenSetup(
      key: const Key('login_with_email_and_password_screen'),
      title: context.l10n.loginSigninEmailPasswordScreenTitle,
      enableScrolling: false,
      slivers: [
        SliverFillRemaining(
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(DesignSpec.screenPadding),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  LoginWithEmailAndPasswordForm(
                    formStateKey: formStateKey,
                    onChanged: () => _onFormChanged(context),
                  ),
                  Spacer(),
                  buildOverlayActionButton(context),
                  Gap.medium(),
                  AppButton(
                    text: 'Sign Up',
                    onTap: () => _onSignupTap(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOverlayActionButton(BuildContext context) {
    switch (state) {
      case ProcessingState.idle:
        return AppButton(
          key: const Key('login_with_email_and_password_button'),
          text: AppLocalizations.of(
            context,
          ).loginSigninEmailPasswordButtonText.toUpperCase(),
          onTap: () => _onSigninTap(context),
        );
      case ProcessingState.processing:
        return AppButton(
          key: const Key('login_with_email_and_password_button'),
          text: AppLocalizations.of(
            context,
          ).loginSigninEmailPasswordButtonText.toUpperCase(),
        );
      case ProcessingState.completed:      
        return AppButton(
          key: const Key('login_with_email_and_password_button'),
          text: AppLocalizations.of(
            context,
          ).loginSigninEmailPasswordButtonText.toUpperCase(),
          bColor: Colors.green.shade600,
        );
      case ProcessingState.error:
        return AppButton(
          key: const Key('login_with_email_and_password_button'),
          text: AppLocalizations.of(
            context,
          ).loginSigninEmailPasswordButtonText.toUpperCase(),
          onTap: () => _onSigninTap(context),
        );
    }
  }
}
