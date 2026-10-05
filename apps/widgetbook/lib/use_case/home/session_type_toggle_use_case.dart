import 'package:material_ui/material_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:home/home.dart';

HomeScreenViewState _activeMode = .sitting;

@widgetbook.UseCase(
  name: 'Default',
  type: SessionTypeToggle,
  path: '[Home]/public/view/',
)
Widget buildSessionTypeToggle(BuildContext context) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Center(
        child: SessionTypeToggle(
          activeMode: _activeMode,
          onModeChanged: (mode) {
            setState(() {_activeMode = mode;});
          },
        ),
      );
    },
  );
}
