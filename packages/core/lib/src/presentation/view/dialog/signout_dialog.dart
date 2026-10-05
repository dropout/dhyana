import 'package:core/src/presentation/viewmodel/auth_state_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:core/l10n/core_localizations.dart';

import 'package:core/src/presentation/design_spec.dart';
import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:core/src/presentation/view/util/toast.dart';


import 'dialog_button.dart';

class SignoutDialog extends StatelessWidget {

  final Future<void> Function() onSignOut;

  const SignoutDialog({
    required this.onSignOut,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(CoreLocalizations.of(context).profileSignoutTitle),
      content: Text(CoreLocalizations.of(context).profileSignoutQuestion),
      backgroundColor: AppColors.backgroundPaperLight,
      actions: [
        DialogButton.secondary(
          key: const Key('signout_dialog_cancel_button'),
          text: CoreLocalizations.of(context).profileSignoutCancel,
          onPressed: () {
            context.pop();
            context.hapticsTap();
          },
        ),
        DialogButton.primary(
          key: const Key('signout_dialog_signout_button'),
          text: CoreLocalizations.of(context).profileSignoutYes,
          onPressed: () {
            // close are you sure dialog
            context.pop();

            // do the signout
            context.read<AuthStateCubit>().signOut();

            context.hapticsTap();
            context.logEvent(name: 'profile_signout_pressed');

            Future.delayed(Durations.medium1, () {
              if (context.mounted) {
                context.showSuccessfulToast(
                  context.coreL10n.signOutSuccessfulMessage
                );
              }
            });

            context.services.homeNavigator.navigateToHome(
              refresh: DateTime.now().millisecondsSinceEpoch,
              type: .go
            );

            onSignOut();
            // context.read<ProfileCubit>().clearData();
          },
        ),
      ],
    );
  }
}
