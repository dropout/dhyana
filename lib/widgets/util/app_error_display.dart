import 'package:flutter/material.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widgets/app_theme_data.dart';

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
    Key? key
  }) : super(key: key);

  void _handleButtonTap(BuildContext context) {
    final void Function()? onTap = onButtonTap;
    if (onTap != null) {
      onTap();
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
          children: [
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_rounded,
                    size: 96,
                  ),
                  const SizedBox(height: AppThemeData.spacingMd),
                  Text(
                    headlineFinal,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  const SizedBox(height: AppThemeData.spacingSm),
                  _buildText(context, textFinal),
                ]
            ),
            if (onButtonTap != null) _buildButton(context, buttonTextFinal),
          ]
      ),
    );

  }

  Widget _buildText(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      )
    );
  }

  Widget _buildButton(BuildContext context, String buttonText) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextButton(
        onPressed: () => _handleButtonTap(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w600
              )
            )
          ],
        ),
      ),
    );
  }

}
