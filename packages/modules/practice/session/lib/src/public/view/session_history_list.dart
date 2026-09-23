import 'package:session/l10n/session_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';

import 'package:core/core.dart';
import 'package:session/src/public/model/session.dart';

class const SessionHistoryList({
  required final List<Session> sessions,
  super.key,
}) extends StatelessWidget {

  Map<DateTime, List<Session>> _groupByDay() {
    final groups = <DateTime, List<Session>>{};
    for (final s in sessions) {
      final day = DateTime(s.startTime.year, s.startTime.month, s.startTime.day);
      groups.putIfAbsent(day, () => []).add(s);
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final groups = _groupByDay();
    final children = <Widget>[
      for (final entry in groups.entries) ...[
        Text(
          DateFormat.yMMMMd(locale.toString()).format(entry.key),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap.small(),
        ...entry.value.map((s) {

          return SessionHistoryListItem(
            startTime: s.startTime,
            endTime: s.endTime,
            duration: s.duration,
            type: s.type,
          );
        }).toList().intersperse(Gap.small()),
        Gap.medium(),
      ]
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg),
      sliver: SliverList(
        delegate: SliverChildListDelegate(children),
      ),
    );
  }

}

class const SessionHistoryListItem({
  required final DateTime startTime,
  required final DateTime endTime,
  required final Duration duration,
  required final SessionType type,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final st = DateFormat.Hm(locale.toString()).format(startTime);
    final et = DateFormat.Hm(locale.toString()).format(endTime);

    return AppCard(
      padding: const EdgeInsets.all(DesignSpec.paddingMd),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$st — $et',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  SessionLocalizations.of(context).minutesPluralWithNumber(duration.inMinutes),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Icon(
            (type == .timer) ?
              Icons.timer_rounded :
              Icons.music_note_rounded,
          )
        ],
      ),
    );
  }

}