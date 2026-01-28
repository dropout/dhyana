import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageUploadNotSafeDialog extends StatelessWidget {
  const ImageUploadNotSafeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).imageNotSafeDialogTitle),
      content: Text(AppLocalizations.of(context).imageNotSafeDialogText
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(AppLocalizations.of(context).imageNotSafeDialogButtonText.toUpperCase()),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }

}
