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
      children: settingsList.map((settings) {
        return ListTile(
          title: Text('${settings.duration.inMinutes}'),
          subtitle: Text('${settings.warmup.inMinutes}'),
          trailing: IconButton(
            onPressed: () => _onListItemTap(context, settings),
            icon: const Icon(Icons.chevron_right),
          )
        );
      }).toList(),
    );
  }
}
