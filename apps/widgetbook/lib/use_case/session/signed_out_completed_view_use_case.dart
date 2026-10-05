import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:session/session.dart';


@widgetbook.UseCase(
  name: 'Default',
  type: SignedOutCompletedView,
  path: '[Session]/public/view/',
)
Widget buildSignedOutCompletedView(BuildContext context) {
  final durationMinutes = context.knobs.int.slider(
    label: 'Duration (minutes)',
    initialValue: 10,
    min: 1,
    max: 120,
  );

  final type = context.knobs.object.dropdown(
    label: 'Session Type',
    options: SessionType.values,
    initialOption: SessionType.timer,
  );

  final endTime = DateTime.now();

  return ColoredBox(
    color: Colors.black,
    child: SignedOutCompletedView(      
      session: Session(
        id: 'preview-session',
        type: type,
        startTime: endTime.subtract(Duration(minutes: durationMinutes)),
        endTime: endTime,
        duration: Duration(minutes: durationMinutes),
      ),
    ),
  );
}