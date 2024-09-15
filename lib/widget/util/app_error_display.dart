import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';

import 'app_button.dart';

class AppErrorDisplay extends StatelessWidget {

  final String? headline;
  final String? text;
  final String? buttonText;
  final VoidCallback? onButtonTap;

  const AppErrorDisplay({
    this.headline,
    this.text,
    this.buttonText,
    this.onButtonTap,
    super.key
  });

  void _handleButtonTap(BuildContext context) {
    final void Function()? onTap = onButtonTap;
    if (onTap != null) {
      onTap();
      context.hapticsTap();
    }
  }

  @override
  Widget build(BuildContext context) {

    String headlineFinal = headline ?? AppLocalizations.of(context).errorHeadline;
    String textFinal = text ?? AppLocalizations.of(context).errorText;
    String buttonTextFinal = buttonText ?? AppLocalizations.of(context).errorButtonText;

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).colorScheme.error,
      child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_rounded,
                  color: Theme.of(context).colorScheme.onError,
                  size: 96,
                ),
                const SizedBox(height: AppThemeData.spacingMd),
                _buildHeadLine(context, headlineFinal),
                const SizedBox(height: AppThemeData.spacingSm),
                _buildText(context, textFinal),
              ]
            ),
            if (onButtonTap != null) _buildButton(context, buttonTextFinal),
          ]
      ),
    );

  }

  Widget _buildHeadLine(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: Theme.of(context).colorScheme.onError,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onError,
      ),
    );
  }

  Widget _buildButton(BuildContext context, String buttonText) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AppButton(
        onTap: () => _handleButtonTap(context),
        text: buttonText,
      ),
    );
  }

}
