import 'package:core/l10n/core_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'dialog_button.dart';

class PhotoAccessDeniedDialog extends StatelessWidget {

  const PhotoAccessDeniedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(CoreLocalizations.of(context).photoAccessDialogTitle),
      content: Text(CoreLocalizations.of(context).photoAccessDialogText
      ),
      actions: <Widget>[
        DialogButton.primary(
          text: CoreLocalizations.of(context).photoAccessDialogButtonText,
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
