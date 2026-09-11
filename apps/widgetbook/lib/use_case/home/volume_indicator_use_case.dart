import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:home/home.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: VolumeIndicator,
  path: '[Home]/public/view/',
)
Widget buildVolumeIndicator(BuildContext context) {
  final volume = context.knobs.double.slider(
    label: 'Volume',
    initialValue: 0.6,
    precision: 2,
    min: 0.0,
    max: 1.0,
  );

  return Center(
    child: VolumeIndicator(
      volumeStream: const Stream<double>.empty(),
      initialVolume: volume,
    ),
  );
}