import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart' hide GlobalMaterialLocalizations;
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:core/core.dart';
import 'package:auth/auth.dart';
import 'package:donate/donate.dart';
import 'package:stats/stats.dart';
import 'package:social/social.dart';
import 'package:profile/profile.dart';
import 'package:timer/timer.dart';
import 'package:chanting/chanting.dart';
import 'package:session/session.dart';

import 'package:stepstones/bootstrap/init_result.dart';
import 'package:stepstones/l10n/app_localizations.dart';

import 'app_providers.dart';


/// The main app widget.
/// It sets up the top-level providers and
/// the MaterialApp with routing.
class App extends StatelessWidget {
  final InitResult initResult;
  late final GoRouter router;

  App({required this.initResult, super.key}) {
    router = GetIt.I.get<GoRouter>();
  }    

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
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MaterialApp.router(
        builder: (BuildContext context, Widget? child) {
          child ??= const SizedBox.shrink();
          return MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1.0,
            child: child,
          );
        },
        routerConfig: router,
        supportedLocales: const [Locale('hu', 'HU'), Locale('en', 'EN')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          AuthLocalizations.delegate,
          CoreLocalizations.delegate,
          DonateLocalizations.delegate,
          StatsLocalizations.delegate,
          SocialLocalizations.delegate,
          ProfileLocalizations.delegate,
          TimerLocalizations.delegate,
          ChantingLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            SessionLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: DesignSpec().themeData,
      ),
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
          padding: EdgeInsets.all(DesignSpec.paddingLg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.build, size: 32, color: Colors.black),
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
        ),
      ),
    );
  }
}
