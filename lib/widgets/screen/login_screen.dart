import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/service/analytics_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/app_screen.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/util/app_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.purpleAccent,
                  child: buildHeadline(context)),
              ),
              buildActions(context),
              buildLegalText(context),
            ]
          ),
          Positioned(
            top: AppThemeData.spacingMd,
            left: AppThemeData.spacingMd,
            child: GestureDetector(
              onTap: () => GoRouter.of(context).goNamed(AppScreen.home.name),
              child: Container(
                padding: const EdgeInsets.all(AppThemeData.spacingSm),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              )
            ),
          ),
        ],
      )
    );
  }

  Widget buildHeadline(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context).loginHeadline1, style: textStyle),
          Text(AppLocalizations.of(context).loginHeadline2, style: textStyle),
          Text(AppLocalizations.of(context).loginHeadline3, style: textStyle),
        ].animate(
          delay: 256.ms,
          interval: 512.ms,
        ).fadeIn(curve: Curves.easeOutExpo, duration: 750.ms).moveY(begin: -24, end: 0, curve: Curves.easeOutExpo, duration: 750.ms),
    );
  }

  Widget buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: Column(
        children: [
          AppButton(
            text: AppLocalizations.of(context).loginSigninGoogle,
            bColor: Colors.black,
            fColor: Colors.white,
            onTap: () => _onLoginWithGoogleTap(context),
          ),
          const SizedBox(height: AppThemeData.spacingMd),
          AppButton(
            text: AppLocalizations.of(context).loginSigninApple,
            bColor: Colors.black,
            fColor: Colors.white,
            onTap: () => _onLoginWithAppleTap(context),
          ),
        ],
      ),
    );
  }

  void _onLoginWithGoogleTap(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(AuthEvent.signinWithGoogle(
      onComplete: (_) => context.replaceNamed(AppScreen.profile.name),
    ));
    Provider.of<AnalyticsService>(context, listen: false)
      .logEvent(name: 'login_with_google_button_pressed');
  }

  void _onLoginWithAppleTap(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(AuthEvent.signinWithApple(
      onComplete: (_) => context.replaceNamed(AppScreen.profile.name),
    ));
    Provider.of<AnalyticsService>(context, listen: false)
      .logEvent(name: 'login_with_apple_button_pressed');
  }

  Widget buildLegalText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppThemeData.spacingMd,
        right: AppThemeData.spacingMd,
        bottom: AppThemeData.spacingMd,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              height: 1.5
          ),
          children: [
            TextSpan(
              text: AppLocalizations.of(context).loginLegalPart1,
            ),
            TextSpan(
              text: AppLocalizations.of(context).loginLegalPart2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _onTermsTap(context),
            ),
            TextSpan(
              text: AppLocalizations.of(context).loginLegalPart3,
            ),
            TextSpan(
              text: AppLocalizations.of(context).loginLegalPart4,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _onPrivacyTap(context),
            ),
            const TextSpan(text: '.',)
          ],
        ),
      ),
    );
  }

  void _onTermsTap(BuildContext context) {
    launchUrl(
      Uri.parse('https://lazits.app/aszf'),
      mode: LaunchMode.inAppWebView,
    );
  }

  void _onPrivacyTap(BuildContext context) {
    launchUrl(
      Uri.parse('https://lazits.app/aszf'),
      mode: LaunchMode.inAppWebView,
    );
  }

}
