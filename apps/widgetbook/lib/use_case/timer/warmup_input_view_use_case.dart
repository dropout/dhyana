import 'package:material_ui/material_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:timer/timer.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: WarmupInputView,
  path: '[Timer]/public/view/timer_settings/',
)
Widget buildWarmupInputView(BuildContext context) {
  // Needs to wrap the widget with a MaterialApp to provide proper localization and theming.
  // Otherwise it's not working how its expected in widgetbook.
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      ...CoreLocalizations.localizationsDelegates,
      ...TimerLocalizations.localizationsDelegates,
    ],
    home: Theme(
      data: DesignSpec().themeData,
      child: Builder(
        builder: (context) {
          // Open via the real showModalBottomSheet flow so styling/behavior matches production.
          // Guard against hot reload re-triggering the callback and stacking sheets.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(context).canPop()) return;

            showModalBottomSheet(
              context: context,
              enableDrag: false,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              useRootNavigator: false,
              builder: (ctx) => WarmupInputView(
                title: 'Warmup',
                onSelect: (duration) {},
              ),
            );
          });
          return const Scaffold(backgroundColor: Colors.transparent);
        },
      ),
    ),
  );
}