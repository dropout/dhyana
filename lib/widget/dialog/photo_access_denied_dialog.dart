import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhotoAccessDeniedDialog extends StatelessWidget {

  const PhotoAccessDeniedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).photoAccessDialogTitle),
      content: Text(AppLocalizations.of(context).photoAccessDialogText
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(AppLocalizations.of(context).photoAccessDialogButtonText.toUpperCase()),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }
}
