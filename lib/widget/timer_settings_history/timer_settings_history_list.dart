import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/route/all.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerSettingsHistoryList extends StatelessWidget {

  final List<TimerSettings> settingsList;

  const TimerSettingsHistoryList({
    required this.settingsList,
    super.key
  });

  void _onListItemTap(BuildContext context, TimerSettings timerSettings) {
    context.goNamed(
      AppScreen.home.name,
      extra: timerSettings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: settingsList.map(
        (settings) => buildListItem(context, settings)
      ).toList(),
    );
  }

  Widget buildListItem(BuildContext context, TimerSettings settings) {
    return ListTile(
      title: Text(
        AppLocalizations.of(context).minutesPlural(settings.duration.inMinutes),
        style: Theme.of(context).textTheme.titleLarge,

      ),
      subtitle: Text(
        '${AppLocalizations.of(context).minutesPlural(settings.warmup.inMinutes)} ${AppLocalizations.of(context).warmup.toLowerCase()}'
      ),
      trailing: IconButton(
        onPressed: () => _onListItemTap(context, settings),
        icon: const Icon(Icons.chevron_right),
      )
    );
  }

}
