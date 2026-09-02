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

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          sessions.map((s) {
            final startTime = DateFormat.Hm(locale.toString()).format(s.startTime);
            final endTime = DateFormat.Hm(locale.toString()).format(s.endTime);
            return AppCard(
              padding: const EdgeInsets.all(DesignSpec.paddingMd),              
              child: Stack(
                children: [
                  Column(                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd(locale.toString()).format(s.startTime),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '$startTime - $endTime',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        context.l10n.minutesPluralWithNumber(s.duration.inMinutes),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      (s.type == .sitting) ? 
                        Icons.timer_rounded : 
                        Icons.music_note_rounded,
                    )
                  )
                ],
              ),
            );
          }).toList().intersperse(Gap.small())
        )
      ),
    );
  }

}
