import 'package:assets/assets.dart';
import 'package:chanting/chanting.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:session/session.dart';
import 'package:social/social.dart';
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
  await shaderService.loadShader(Assets.shaderParchmentNoise);

  registerFallbackValue(Duration.zero);

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
        // Inherited browser setting was true
        data: MediaQuery.of(context).copyWith(disableAnimations: false),
        child: MultiProvider(
          providers: [
            Provider<Services>(create: (_) => configureServicesForUseCase()),
          ],
          child: Theme(
            data: DesignSpec().themeData,
            child: SizedBox.expand(child: child),
          ),
        ),
      ),
      addons: [
        ViewportAddon([
          Viewports.none,
          // Breakpoint xs to sm: 360 - 480
          AndroidViewports.samsungGalaxyS20,
          IosViewports.iPhone12Mini,          
          AndroidViewports.samsungGalaxyNote20,
          IosViewports.iPhone13ProMax,
          // Breakpoint sm to md: 480 - 768
          ViewportData(
            name: 'Custom 520x800',
            width: 520,
            height: 800,
            pixelRatio: 1.0,
            platform: TargetPlatform.windows
          ),
          ViewportData(
            name: 'Custom 640x1024',
            width: 640,
            height: 1024,
            pixelRatio: 1.0,
            platform: TargetPlatform.windows
          ),
          // Breakpoint md to lg: 768 - 1024
          IosViewports.iPad,
          // Breakpoint lg to xl: 1024 - 1280
          IosViewports.iPad12InchesGen2,
          AndroidViewports.largeTablet,
          // Breakpoint xl to ...: 1280 +
          MacosViewports.desktop,
        ]),
        BackgroundAddon(initialColor: AppColors.backgroundPaper),
        LocalizationAddon(        
          locales: TimerLocalizations.supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            ...CoreLocalizations.localizationsDelegates,
            ...TimerLocalizations.localizationsDelegates,
            ...ChantingLocalizations.localizationsDelegates,
            ...SessionLocalizations.localizationsDelegates,
            ...ProfileLocalizations.localizationsDelegates,
            ...SocialLocalizations.localizationsDelegates,
          ],
        ),
        InspectorAddon(),
      ],
    );
  }
}

Services configureServicesForUseCase() {
  final mockServices = MockServices();
  final hapticsService = MockHapticsService();
  final overlayService = MockOverlayService();
  final crashlyticsService = MockCrashlyticsService();
  final resourceResolver = MockResourceResolver();

  when(() => mockServices.hapticsService).thenReturn(hapticsService);
  when(() => mockServices.overlayService).thenReturn(overlayService);
  when(() => mockServices.shaderService).thenReturn(shaderService);
  when(() => mockServices.resourceResolver).thenReturn(resourceResolver);
  when(() => mockServices.crashlyticsService).thenReturn(crashlyticsService);

  when(() => resourceResolver.resolveStoragePath(any<String>())).thenAnswer((
    _,
  ) async {
    return Assets.avatarPlaceholder;
  });

  return mockServices;
}
