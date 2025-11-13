import 'package:dhyana/bloc/remote_settings/remote_settings_cubit.dart';
import 'package:dhyana/init/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';

import 'app_colors.dart';
import 'app_providers.dart';
import 'app_routes.dart';

/// The main app widget.
/// It sets up the top-level providers and
/// the MaterialApp with routing.
class App extends StatelessWidget {

  final InitResult initResult;
  late final GoRouter router;

  App({
    required this.initResult,
    super.key
  }) :
    router = createAppRouter(initResult: initResult);


  @override
  Widget build(BuildContext context) {
    return AppProviders(
      initResult: initResult,
      child: BlocBuilder<RemoteSettingsCubit, RemoteSettingsState>(
      builder: (context, state) {
          if (state.settings.maintenanceModeEnabled) {
            return buildMaintenanceModeApp(context);
          } else {
            return buildApp(context);
          }
        },
      ),
    );
  }

  /// Builds the main app.
  Widget buildApp(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // unfocus user input if clicks anywhere on screen
        // useful for hiding keyboard after user input
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MaterialApp.router(
        builder: (BuildContext context, Widget? child) {
          child ??= const SizedBox.shrink();
          return MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1.0,
            child: child
          );
        },
        routerConfig: router,
        supportedLocales: const [
          Locale('hu', 'HU'),
          Locale('en', 'EN')
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: AppThemeData(isDark: false).themeData,
      )
    );
  }

  /// Builds a simplified maintenance mode app with
  /// a localized maintenance message.
  Widget buildMaintenanceModeApp(BuildContext context) {
    return MaterialApp(
      color: AppColors.backgroundPaper,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Scaffold(
        backgroundColor: AppColors.backgroundPaper,
        body: Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingLg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.build,
                size: 32,
                color: Colors.black,
              ),
              Gap.medium(),
              Text(
                AppLocalizations.of(context).underMaintenanceTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap.small(),
              Text(
                AppLocalizations.of(context).underMaintenanceBody,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
