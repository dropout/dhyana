import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/app_screen.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/util/app_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppThemeData.spacingXs),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
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
          Text('Ki', style: textStyle),
          Text('vagy', style: textStyle),
          Text('te?', style: textStyle),
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
          ),
          const SizedBox(height: AppThemeData.spacingMd),
          AppButton(
            text: AppLocalizations.of(context).loginSigninApple,
            bColor: Colors.black,
            fColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildLegalText(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(AppThemeData.spacingMd),
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

}
