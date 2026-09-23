import 'package:session/l10n/session_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';

import 'package:core/core.dart';
import 'package:session/src/public/model/session.dart';

class SessionHistoryList extends StatelessWidget {

  final List<Session> sessions;

  const SessionHistoryList({
    required this.sessions,
    super.key,
  });

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
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Gap.small(),
        ...entry.value.map((s) {
          final startTime = DateFormat.Hm(locale.toString()).format(s.startTime);
          final endTime = DateFormat.Hm(locale.toString()).format(s.endTime);
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
                        '$startTime - $endTime',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        SessionLocalizations.of(context).minutesPluralWithNumber(s.duration.inMinutes),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  (s.type == .timer) ?
                    Icons.timer_rounded :
                    Icons.music_note_rounded,
                )
              ],
            ),
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
