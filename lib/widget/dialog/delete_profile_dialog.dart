import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteProfileDialog extends StatelessWidget {
  const DeleteProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).profileDeleteTitle),
      content: Text(AppLocalizations.of(context).profileDeleteQuestion),
      backgroundColor: AppColors.backgroundPaperLight,
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(AppLocalizations.of(context).profileDeleteCancel),
          onPressed: () {
            context.pop();
            context.hapticsTap();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(AppLocalizations.of(context).profileDeleteYes,),
          onPressed: () {
            context.pop(); // close are you sure dialog
            context.hapticsTap();
            context.logEvent(name: 'profile_delete_pressed');
            const DeleteProfileRoute().go(context);
          },
        ),
      ],
    );
  }
}
