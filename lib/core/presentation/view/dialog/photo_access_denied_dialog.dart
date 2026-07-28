import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dialog_button.dart';

class PhotoAccessDeniedDialog extends StatelessWidget {

  const PhotoAccessDeniedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).photoAccessDialogTitle),
      content: Text(AppLocalizations.of(context).photoAccessDialogText
      ),
      actions: <Widget>[
        DialogButton.primary(
          text: AppLocalizations.of(context).photoAccessDialogButtonText,
          onPressed: () {
            GoRouter.of(context).pop();
            // Open app settings
            // Note: Implementation to open app settings is not included here
          },
        ),
      ],
    );
  }
}
