import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/login/login_headline_text_effect.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignedOutView extends StatelessWidget {

  const LoginSignedOutView({
    super.key,
  });

  void _onLoginWithGoogleTap(BuildContext context) {
    context.read<AuthCubit>().signInWithGoogle(
      onComplete: (user, isFirstSignin) => _handleSigninComplete(
        context, user, isFirstSignin
      )
    );
    context.logEvent(name: 'login_with_google_button_pressed');
    context.hapticsTap();
  }

  void _onLoginWithAppleTap(BuildContext context) {
    context.read<AuthCubit>().signInWithApple(
      onComplete: (user, isFirstSignin) => _handleSigninComplete(
        context, user, isFirstSignin
      )
    );
    context.logEvent(name: 'login_with_apple_button_pressed');
    context.hapticsTap();
  }

  void _onTermsTap(BuildContext context) {
    context.services.urlLauncher.launchInAppWebView('https://google.com');
    context.logEvent(name: 'view_tou_pressed');
    context.hapticsTap();
  }


  void _onPrivacyTap(BuildContext context) {
    context.services.urlLauncher.launchInAppWebView('https://google.com');
    context.logEvent(name: 'view_privacy_policy_pressed');
    context.hapticsTap();
  }

  void _handleSigninComplete(BuildContext context, user, isFirstSignin) {
    if (isFirstSignin) {
      ProfileWizardRoute(profileId: user.uid).replace(context);
    } else {
      ProfileRoute(profileId: user.uid).replace(context);
    }
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
              Expanded(
                child: Container(child: _buildHeadline(context)),
              ),
              _buildActions(context),
              _buildLegalText(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .displayLarge!
        .copyWith(
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
            text: AppLocalizations
                .of(context)
                .loginHeadline1,
            textStyle: textStyle,
            duration: letterDuration * 3,
          ),
          LoginHeadlineTextEffect(
            text: AppLocalizations
                .of(context)
                .loginHeadline2,
            textStyle: textStyle,
            duration: letterDuration * 3,
            initialDelay: Durations.medium1,
          ),
          LoginHeadlineTextEffect(
            text: AppLocalizations
                .of(context)
                .loginHeadline3,
            textStyle: textStyle,
            duration: letterDuration * 4,
            initialDelay: Durations.long2,
          ),
        ]);
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DesignSpec.spacingMd),
      child: Column(
        children: [
          AppButton(
            text: AppLocalizations
                .of(context)
                .loginSigninGoogle,
            bColor: Colors.black,
            fColor: Colors.white,
            onTap: () => _onLoginWithGoogleTap(context),
          ),
          const SizedBox(height: DesignSpec.spacingMd),
          AppButton(
            text: AppLocalizations
                .of(context)
                .loginSigninApple,
            bColor: Colors.black,
            fColor: Colors.white,
            onTap: () => _onLoginWithAppleTap(context),
          ),
        ],
      ),
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
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .copyWith(
              height: 1.5
          ),
          children: [
            TextSpan(
              text: AppLocalizations
                  .of(context)
                  .loginLegalPart1,
            ),
            TextSpan(
              text: AppLocalizations
                  .of(context)
                  .loginLegalPart2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => _onTermsTap(context),
            ),
            TextSpan(
              text: AppLocalizations
                  .of(context)
                  .loginLegalPart3,
            ),
            TextSpan(
              text: AppLocalizations
                  .of(context)
                  .loginLegalPart4,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => _onPrivacyTap(context),
            ),
            const TextSpan(text: '.',)
          ],
        ),
      ),
    );
  }

}
