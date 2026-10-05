import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: AppMap,
  path: '[Core]/presentation/view/',
)
Widget buildAppMapUseCase(BuildContext context) {
  final name = context.knobs.string(
    label: 'Name',
    initialValue: 'Budapest',
  );

  final latitude = context.knobs.double.slider(
    label: 'Latitude',
    initialValue: 47.4979,
    min: -90,
    max: 90,
  );

  final longitude = context.knobs.double.slider(
    label: 'Longitude',
    initialValue: 19.0402,
    min: -180,
    max: 180,
  );

  return Center(
    child: SizedBox(
      width: 360,
      height: 260,
      child: AppMap(
        name: name,
        latitude: latitude,
        longitude: longitude,
        zoom: 10,
      ),
    ),
  );
}
