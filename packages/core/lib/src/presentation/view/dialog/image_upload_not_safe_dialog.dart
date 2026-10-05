import 'package:core/l10n/core_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'dialog_button.dart';

class ImageUploadNotSafeDialog extends StatelessWidget {

  const ImageUploadNotSafeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(CoreLocalizations.of(context).imageNotSafeDialogTitle),
      content: Text(CoreLocalizations.of(context).imageNotSafeDialogText
      ),
      actions: <Widget>[
        DialogButton.primary(
          text: CoreLocalizations.of(context).imageNotSafeDialogButtonText,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }

}
