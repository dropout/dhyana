import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:stepstones_widgetbook/addons/background_addon.dart';
import 'package:timer/timer.dart';

import 'main.directories.g.dart';


final ShaderService shaderService = DefaultShaderService();

void main() async {

  await shaderService.loadShader(Assets.shaderLinearGradientMask);
  await shaderService.loadShader(Assets.shaderGradientFlow);

  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      appBuilder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          disableAnimations: false
        ),
        child: MultiProvider(
          providers: [Provider<Services>(create: (_) => configureServicesForUseCase())],
          child: Theme(
            data: DesignSpec().themeData,
            child: SizedBox.expand(child: child),
          ),
        ),
      ),
      addons: [
        ViewportAddon([
          Viewports.none,
          IosViewports.iPhone13,
          IosViewports.iPad12InchesGen2,
          AndroidViewports.samsungGalaxyNote20,
        ]),
        BackgroundAddon(initialColor: AppColors.backgroundPaper),
        LocalizationAddon(
          locales: TimerLocalizations.supportedLocales,
          localizationsDelegates: [
            ...CoreLocalizations.localizationsDelegates,
            ...TimerLocalizations.localizationsDelegates,            
          ],
        ),
      ],
    );
  }
}

Services configureServicesForUseCase() {
  final mockServices = MockServices();
  final hapticsService = MockHapticsService();
  final overlayService = MockOverlayService();

  when(() => mockServices.hapticsService).thenReturn(hapticsService);
  when(() => mockServices.overlayService).thenReturn(overlayService);
  when(() => mockServices.shaderService).thenReturn(shaderService);
  return mockServices;
}
