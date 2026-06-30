import 'dart:async';

import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

/// A widget that displays an empty screen with a button at the bottom.
/// The button is displayed at the bottom of the screen, there is no other content.
/// Because redirect happens after the login was successful,
/// this screen is just a safety precaution to prevent the user stuck in a
/// loading screen if the redirect fails for some reason.

/// The button is only shown after a certain amount of time has passed,
/// to prevent brief flashes of the button when the redirect is successful.
class LoginSignedInView extends StatefulWidget {
  final String profileId;
  final Duration buttonDelay;

  const LoginSignedInView({
    required this.profileId,
    this.buttonDelay = const Duration(seconds: 2),
    super.key,
  });

  @override
  State<LoginSignedInView> createState() => _LoginSignedInViewState();
}

class _LoginSignedInViewState extends State<LoginSignedInView> {
  Timer? _buttonTimer;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _buttonTimer = Timer(widget.buttonDelay, _showBottomButton);
  }

  @override
  void dispose() {
    _buttonTimer?.cancel();
    super.dispose();
  }

  void _onButtonTap(BuildContext context, String uid) {
    ProfileRoute(profileId: uid).replace(context);
  }

  void _showBottomButton() {
    if (!mounted) {
      return;
    }
    setState(() => _showButton = true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: SizedBox.shrink()),
          Padding(
            padding: const EdgeInsets.all(DesignSpec.spacingLg),
            child: AnimatedSwitcher(
              duration: Durations.medium2,
              child: _showButton
                  ? AppButton(
                      text: context.l10n.loginGoToProfile.toUpperCase(),
                      bColor: Colors.black,
                      fColor: Colors.white,
                      onTap: () => _onButtonTap(context, widget.profileId),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
