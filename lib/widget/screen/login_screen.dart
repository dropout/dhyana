import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/util/launch_url.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_button.dart';

class LoginScreen extends StatelessWidget {

  final UrlLauncher urlLauncher;

  const LoginScreen({
    this.urlLauncher = const UrlLauncher(),
    super.key,
  });

  void _onLoginWithGoogleTap(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(AuthEvent.signinWithGoogle(
      onComplete: (user, isFirstSignin) => _handleSigninComplete(
        context, user, isFirstSignin
      )
    ));
    context.logEvent(name: 'login_with_google_button_pressed');
    context.hapticsTap();
  }

  void _onLoginWithAppleTap(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(AuthEvent.signinWithApple(
      onComplete: (user, isFirstSignin) => _handleSigninComplete(
        context, user, isFirstSignin
      )
    ));
    context.logEvent(name: 'login_with_apple_button_pressed');
    context.hapticsTap();
  }

  void _onTermsTap(BuildContext context) {
    urlLauncher.launchInAppWebView('https://google.com');
    context.logEvent(name: 'view_tou_pressed');
    context.hapticsTap();
  }

  void _onDismissErrorTap(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const AuthEvent.dismissSigninError());
  }

  void _onPrivacyTap(BuildContext context) {
    urlLauncher.launchInAppWebView('https://google.com');
    context.logEvent(name: 'view_privacy_policy_pressed');
    context.hapticsTap();
  }

  void _handleSigninComplete(BuildContext context ,user, isFirstSignin) {
    if (isFirstSignin) {
      ProfileWizardRoute(profileId: user.uid).replace(context);
    } else {
      ProfileRoute(profileId: user.uid).replace(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late final Widget body;
        Color backgroundColor = Theme.of(context).colorScheme.surface; 
        switch (state) {
          case AuthStateErrorOccured():
            backgroundColor = Theme.of(context).colorScheme.error;
            body = buildErrorState(context);
          case AuthStateSigningIn():
            body = buildLoadingState(context);
          default:
            body = buildSignedOutState(context);
        }

        return Scaffold(
          backgroundColor: backgroundColor,
          body: body,
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            leading: CustomBackButton(),
          ),
        );
      }
    );
  }

  Widget buildSignedOutState(BuildContext context) {
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
                  child: Container(
                    child: buildHeadline(context)),
                ),
                buildActions(context),
                buildLegalText(context),
              ]
            ),
          ],
        ),
      );
  }

  Widget buildErrorState(BuildContext context) {
    return SafeArea(
      child: AppErrorDisplay(
        onButtonTap: () {
          _onDismissErrorTap(context);
        },
      ),
    );
  }

  Widget buildLoadingState(BuildContext context) {
    return const AppLoadingDisplay();
  }

  Widget buildHeadline(BuildContext context) {
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
      ]
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
                decoration: TextDecoration.underline,
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
                decoration: TextDecoration.underline,
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

class LoginHeadlineTextEffect extends StatefulWidget {

  final String text;
  final TextStyle textStyle;
  final Duration duration;
  final Duration initialDelay;

  const LoginHeadlineTextEffect({
    required this.text,
    required this.textStyle,
    this.duration = const Duration(seconds: 2),
    this.initialDelay = Duration.zero,
    super.key,
  });

  @override
  State<LoginHeadlineTextEffect> createState() => _LoginHeadlineTextEffectState();
}

class _LoginHeadlineTextEffectState extends State<LoginHeadlineTextEffect>
with SingleTickerProviderStateMixin {

  late final AnimationController animController;
  late final List<Animation<double>> _opacities;
  late final List<_AnimDto> data;

  @override
  void initState() {
    animController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    data = List.generate(widget.text.length, (i) => _AnimDto(
      index: i,
      letter: widget.text[i],
    ));

    final intervalData = calculateIntervals(
      intervalCount: data.length,
      overlapFactor: 0.75,
    );

    // Create opacity animations for each text segment
    _opacities = data.map((item) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animController,
          curve: Interval(
            intervalData.$2[item.index],
            intervalData.$2[item.index] + intervalData.$1,
            curve: Curves.easeIn,
          ),
        ),
      );
    }).toList();

    Future.delayed(widget.initialDelay, () {
      if (mounted) {
        animController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animController,
      builder: (context, _) {
        return RichText(
          text: TextSpan(
            children: data.map((d) {
              return WidgetSpan(
                child: Opacity(
                  opacity: _opacities[d.index].value,
                  child: Text(
                    d.letter,
                    style: widget.textStyle,
                  )
                ),
              );
            }).toList(),
          )
        );
      },
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

}

class _AnimDto {
  final int index;
  final String letter;

  const _AnimDto({
    required this.index,
    required this.letter,
  }) : assert(letter.length == 1, 'letter must be a single character');

}
