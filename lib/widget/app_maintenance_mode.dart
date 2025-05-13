import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_theme_data.dart';

class AppMaintenanceMode extends StatelessWidget {

  const AppMaintenanceMode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.backgroundPaper,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Scaffold(
        backgroundColor: AppColors.backgroundPaper,
        body: MaintenanceMessage(),
      ),
    );
  }

}

class MaintenanceMessage extends StatelessWidget {

  const MaintenanceMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }

}

