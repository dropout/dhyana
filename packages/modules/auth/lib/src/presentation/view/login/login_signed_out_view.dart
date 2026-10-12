import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:assets/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:particle_field/particle_field.dart';

import 'package:core/core.dart';
import 'package:auth/l10n/auth_localizations.dart';
import 'package:auth/src/presentation/view/login/login_headline_text_effect.dart';

class LoginSignedOutView extends StatelessWidget {
  const LoginSignedOutView({super.key});

  void _onLoginWithGoogleTap(BuildContext context) {
    context.read<AuthStateCubit>().signinWithGoogle();
    context.logEvent(name: 'login_with_google_button_pressed');
    context.hapticsTap();
  }

  void _onLoginWithAppleTap(BuildContext context) {
    context.read<AuthStateCubit>().signinWithApple();
    context.logEvent(name: 'login_with_apple_button_pressed');
    context.hapticsTap();
  }

  void _onLoginWithEmailAndPasswordTap(BuildContext context) {
    context.services.authNavigator.navigateToLoginWithEmailAndPassword();
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
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        ParchmentBackground(),
        QMarkFlythroughExample(),
        SafeArea(
          top: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              // Animated headline text
              Expanded(child: Container(child: _buildHeadline(context))),
              
              // Actions
              _buildActions(context),
              Gap.large(),
              
              // Legal text
              _buildLegalText(context),
              
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeadline(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.displayLarge!.copyWith(
      fontWeight: FontWeight.w900,
      fontSize: 80,
      color: Colors.black,
      height: .9,
      shadows: [
        Shadow(
          offset: Offset.zero,
          blurRadius: 60.0,
          color: AppColors.charcoal.withValues(alpha: 0.5),
        ),
      ]
    );

    Duration letterDuration = Durations.medium3;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginHeadlineTextEffect(
          text: AuthLocalizations.of(context).loginHeadline1,
          textStyle: textStyle,
          duration: letterDuration * 3,
        ),
        LoginHeadlineTextEffect(
          text: AuthLocalizations.of(context).loginHeadline2,
          textStyle: textStyle,
          duration: letterDuration * 3,
          initialDelay: Durations.medium1,
        ),
        LoginHeadlineTextEffect(
          text: AuthLocalizations.of(context).loginHeadline3,
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
            text: AuthLocalizations.of(context).loginSigninGoogle,
            bColor: Colors.black,
            fColor: AppColors.appWhite,
            onTap: () => _onLoginWithGoogleTap(context),
          ),
          Gap.medium(),
          AppButton(
            key: const Key('login_with_apple_button'),
            text: AuthLocalizations.of(context).loginSigninApple,
            bColor: Colors.black,
            fColor: AppColors.appWhite,
            onTap: () => _onLoginWithAppleTap(context),
          ),
          Gap.medium(),
          AppButton(
            key: const Key('login_with_email_and_password_button'),
            text: AuthLocalizations.of(context).loginSigninEmailPassword,
            bColor: Colors.black,
            fColor: AppColors.appWhite,
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
      text: AuthLocalizations.of(context).loginSigninEmailPassword,
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
            TextSpan(text: AuthLocalizations.of(context).loginLegalPart1),
            TextSpan(
              text: AuthLocalizations.of(context).loginLegalPart2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _onTermsTap(context),
            ),
            TextSpan(text: AuthLocalizations.of(context).loginLegalPart3),
            TextSpan(
              text: AuthLocalizations.of(context).loginLegalPart4,
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


/// A Material-free particle animation using only Flutter's widgets library.
class QMarkFlythroughExample extends StatelessWidget {
  const QMarkFlythroughExample({super.key});

  @override
  Widget build(BuildContext context) => const Directionality(
    textDirection: TextDirection.ltr,
    child: _FlythroughScene(),
  );
}

class _FlythroughScene extends StatefulWidget {
  const new();
  @override
  State<_FlythroughScene> createState() => _FlythroughSceneState();
}

class _FlythroughSceneState extends State<_FlythroughScene>
    with SingleTickerProviderStateMixin {
  bool ready = false;

  late final QuestionMarkFlyThrough qMarkFlyThrough;
  late final ParticleController controller;
  late final ParticleCamera camera;
  late final ParticleRenderer renderer;

  @override
  void initState() {
    super.initState();

    final r = math.Random();
    qMarkFlyThrough = QuestionMarkFlyThrough(random: r);

    controller = ParticleController(
      vsync: this,
      system: qMarkFlyThrough.system,
    );

    camera = ParticleCamera(
      fovY: 90,
      distance: 400,
    );

    rootBundle.load(Assets.qMark).then((imageByteData) async {
      final codec = await ui.instantiateImageCodec(
        imageByteData.buffer.asUint8List(),
      );
      final image = (await codec.getNextFrame()).image;

      renderer = AtlasRenderer3D(
        camera: camera,
        image: image,
        spriteSize: 32,        
      );

      if (!mounted) return;

      setState(() {
        print('Renderer is ready');
        ready = true;
      });

    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!ready) return const SizedBox.shrink();

    return Stack(
      fit: StackFit.expand,
      children: [ParticleField(controller: controller, renderer: renderer)],
    );
  }
}
