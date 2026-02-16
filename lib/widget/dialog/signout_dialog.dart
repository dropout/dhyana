import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'dialog_button.dart';

class SignoutDialog extends StatelessWidget {

  const SignoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).profileSignoutTitle),
      content: Text(AppLocalizations.of(context).profileSignoutQuestion),
      backgroundColor: AppColors.backgroundPaperLight,
      actions: [
        DialogButton.secondary(
          text: AppLocalizations.of(context).profileSignoutCancel,
          onPressed: () {
            context.pop();
            context.hapticsTap();
          },
        ),
        DialogButton.primary(
          text: AppLocalizations.of(context).profileSignoutYes,
          onPressed: () {
            // close are you sure dialog
            context.pop();

            // do the signout
            context.read<AuthCubit>().signOut();

            context.hapticsTap();
            context.logEvent(name: 'profile_signout_pressed');

            Future.delayed(Durations.medium1, () {
              if (context.mounted) {
                context.showSuccessfulToast(
                  AppLocalizations.of(context).signOutSuccessfulMessage
                );
              }
            });

            const HomeRoute().go(context);
            context.read<ProfileCubit>().clearData();
          },
        ),
      ],
    );
  }
}
