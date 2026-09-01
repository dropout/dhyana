import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dhyana/l10n/app_localizations.dart';
import 'package:core/core.dart';
import 'package:core/src/routes/auth_routes.dart';
import 'package:auth/src/presentation/view/login/login_headline_text_effect.dart';


class LoginSignedOutView extends StatelessWidget {
  const LoginSignedOutView({super.key});

  void _onLoginWithGoogleTap(BuildContext context) {
    context.read<AuthCubit>().signInWithGoogle();
    context.logEvent(name: 'login_with_google_button_pressed');
    context.hapticsTap();
  }

  void _onLoginWithAppleTap(BuildContext context) {
    context.read<AuthCubit>().signInWithApple();
    context.logEvent(name: 'login_with_apple_button_pressed');
    context.hapticsTap();
  }

  void _onLoginWithEmailAndPasswordTap(BuildContext context) {
    LoginWithEmailAndPasswordRoute().push(context);
    context.logEvent(name: 'login_with_email_and_password_button_pressed');
    context.hapticsTap();
  }

  void _onTermsTap(BuildContext context) {
    // TODO: Replace with actual terms of service URL
    context.services.urlLauncher.launchInAppWebView('https://google.com');
    context.logEvent(name: 'view_tou_pressed');
    context.hapticsTap();
  }

  void _onPrivacyTap(BuildContext context) {
    // TODO: Replace with actual privacy policy URL
    context.services.urlLauncher.launchInAppWebView('https://google.com');
    context.logEvent(name: 'view_privacy_policy_pressed');
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container(child: _buildHeadline(context))),
              _buildActions(context),
              _buildLegalText(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.displayLarge!.copyWith(
      fontWeight: FontWeight.w900,
      fontSize: 80,
      color: Colors.black,
      height: .9,
    );

    Duration letterDuration = Durations.medium3;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginHeadlineTextEffect(
          text: AppLocalizations.of(context).loginHeadline1,
          textStyle: textStyle,
          duration: letterDuration * 3,
        ),
        LoginHeadlineTextEffect(
          text: AppLocalizations.of(context).loginHeadline2,
          textStyle: textStyle,
          duration: letterDuration * 3,
          initialDelay: Durations.medium1,
        ),
        LoginHeadlineTextEffect(
          text: AppLocalizations.of(context).loginHeadline3,
          textStyle: textStyle,
          duration: letterDuration * 4,
          initialDelay: Durations.long2,
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DesignSpec.spacingMd),
      child: Column(
        children: [
          AppButton(
            key: const Key('login_with_google_button'),
            text: AppLocalizations.of(context).loginSigninGoogle,
            bColor: Colors.black,
            fColor: Colors.white,
            onTap: () => _onLoginWithGoogleTap(context),
          ),
          Gap.medium(),
          AppButton(
            key: const Key('login_with_apple_button'),
            text: AppLocalizations.of(context).loginSigninApple,
            bColor: Colors.black,
            fColor: Colors.white,
            onTap: () => _onLoginWithAppleTap(context),
          ),
          Gap.medium(),
          AppButton(
            key: const Key('login_with_email_and_password_button'),
            text: AppLocalizations.of(context).loginSigninEmailPassword,
            bColor: Colors.black,
            fColor: Colors.white,
            onTap: () => _onLoginWithEmailAndPasswordTap(context),
          ),
        ],
      ),
    );
  }

  /// Only build the email and password button if the
  /// the enviroment variable `ENABLE_EMAIL_PASSWORD_SIGNIN` is set to true.
  Widget buildEmailAndPasswordButton(BuildContext context) {    
    final bool enableEmailPasswordSigning = bool.fromEnvironment(
      'ENABLE_EMAIL_PASSWORD_SIGNIN',
    );
    if (!enableEmailPasswordSigning) return const SizedBox.shrink();

    return AppButton(
      text: AppLocalizations
          .of(context)
          .loginSigninEmailPassword,
      bColor: Colors.black,
      fColor: Colors.white,
      onTap: () => _onLoginWithEmailAndPasswordTap(context),
    );
  }

  Widget _buildLegalText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: DesignSpec.spacingMd,
        right: DesignSpec.spacingMd,
        bottom: DesignSpec.spacingMd,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          children: [
            TextSpan(text: AppLocalizations.of(context).loginLegalPart1),
            TextSpan(
              text: AppLocalizations.of(context).loginLegalPart2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _onTermsTap(context),
            ),
            TextSpan(text: AppLocalizations.of(context).loginLegalPart3),
            TextSpan(
              text: AppLocalizations.of(context).loginLegalPart4,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _onPrivacyTap(context),
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
