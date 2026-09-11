import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:timer/timer.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: InputButton,
  path: '[Timer]/public/view/timer_settings/',
)
Widget buildInputButton(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: '30 minutes');

  return Center(
    child: InputButton(
      onTap: () {},
      child: Text(
        label,
        style: context.theme.textTheme.titleMedium?.copyWith(
          color: Colors.white,          
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Circular',
  type: InputButton,
  path: '[Timer]/public/view/timer_settings/',
)
Widget buildCircularInputButton(BuildContext context) {
  final minutes = context.knobs.int.slider(
    label: 'Minutes',
    min: 0,
    max: 60,
    initialValue: 4,
  );

  return Center(
    child: InputButton(
      onTap: () {},
      padding: const EdgeInsets.all(DesignSpec.paddingLg),
      shape: CircleBorder(),      
      textStyle: context.theme.textTheme.displaySmall!.copyWith(
        color: AppColors.buttonForeground,
        fontWeight: FontWeight.w900,
        // height: 1.0,
      ),
      child: SizedBox.square(
        dimension: DesignSpec.circleSm, 
        child: Center(child: Text(minutes.toString()))
      ),
    ),
  );
}
