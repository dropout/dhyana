import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:dhyana/l10n/app_localizations.dart';

import 'package:core/src/presentation/design_spec.dart';
import 'package:core/src/presentation/view/util/app_context.dart';

import 'dialog_button.dart';


class DeleteProfileDialog extends StatelessWidget {

  final String profileId;

  const DeleteProfileDialog({
    required this.profileId, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).profileDeleteTitle),
      content: Text(AppLocalizations.of(context).profileDeleteQuestion),
      backgroundColor: AppColors.backgroundPaperLight,
      actions: [
        DialogButton.secondary(
          text: AppLocalizations.of(context).profileDeleteCancel,
          onPressed: () {
            context.pop();
            context.hapticsTap();
          },
        ),
        DialogButton.primary(
          text: AppLocalizations.of(context).profileDeleteYes,
          onPressed: () {
            context.pop(); // close are you sure dialog
            context.hapticsTap();
            context.logEvent(name: 'profile_delete_pressed');
            context.services.profileNavigator.navigateToProfileDelete(profileId, type: .go);
          },
        )
      ],
    );
  }
}
