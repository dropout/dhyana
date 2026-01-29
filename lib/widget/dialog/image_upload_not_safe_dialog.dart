import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dialog_button.dart';

class ImageUploadNotSafeDialog extends StatelessWidget {

  const ImageUploadNotSafeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).imageNotSafeDialogTitle),
      content: Text(AppLocalizations.of(context).imageNotSafeDialogText
      ),
      actions: <Widget>[
        DialogButton.primary(
          text: AppLocalizations.of(context).imageNotSafeDialogButtonText,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }

}
