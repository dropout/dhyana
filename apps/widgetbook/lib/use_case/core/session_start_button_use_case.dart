import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: SessionStartButton,
  path: '[Core]/presentation/view/',
)
Widget buildSessionStartButton(BuildContext context) {
  final shaderEnabled = context.knobs.boolean(
    label: 'Shader Enabled',
    initialValue: true,
  );

  return Center(
    child: ShaderRenderingScope(
      enabled: shaderEnabled,
      child: SessionStartButton(onTap: () {}),
    ),
  );
}
