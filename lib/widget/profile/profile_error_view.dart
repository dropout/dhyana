import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileErrorView extends StatelessWidget {

  const ProfileErrorView({
    super.key
  });

  void _handleOkButtonTap(BuildContext context) {
    context.pop();
  }

  // void _handleLogoutButtonTap(BuildContext context) {
  //   BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signOut());
  //   context.pop();
  // }

  @override
  Widget build(BuildContext context) {
    String headlineFinal = AppLocalizations.of(context).errorHeadline;
    String textFinal = AppLocalizations.of(context).errorText;
    String okButtonText = AppLocalizations.of(context).errorButtonText;

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).colorScheme.error,
      child: Column(
        children: [
          Expanded(
            child: buildCenter(context, headlineFinal, textFinal),
          ),
          buildButtons(context, okButtonText),
        ],
      )
    );

    //   child: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //
    //
    //
    //       Column(
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             const Icon(
    //               Icons.error_rounded,
    //               size: 96,
    //             ),
    //             const SizedBox(height: AppThemeData.spacingMd),
    //             Text(
    //                 headlineFinal,
    //                 textAlign: TextAlign.center,
    //                 style: const TextStyle(
    //                     fontSize: 32,
    //                     fontWeight: FontWeight.w600
    //                 )
    //             ),
    //             const SizedBox(height: AppThemeData.spacingSm),
    //             _buildText(context, textFinal),
    //           ]
    //       ),
    //       if (onButtonTap != null) _buildButton(context, okButtonText),
    //     ]
    //   ),
    // );
  }

  Widget buildCenter(
    BuildContext context,
    String headlineFinal,
    String textFinal,
  ) {
    return Column(
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
    );
  }

  Widget buildButtons(BuildContext context, String buttonText) {
    return Column(
      children: [
        TextButton(
          onPressed: () => _handleOkButtonTap(context),
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
      ],
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

  // Widget _buildButton(BuildContext context, String buttonText) {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: TextButton(
  //       onPressed: () => _handleOkButtonTap(context),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //               buttonText,
  //               style: const TextStyle(
  //                   fontSize: 21.0,
  //                   fontWeight: FontWeight.w600
  //               )
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
