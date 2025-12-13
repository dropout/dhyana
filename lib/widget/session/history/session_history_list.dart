import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingLg),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          sessions.map((s) {
            final startTime = DateFormat.Hm(locale.toString()).format(s.startTime);
            final endTime = DateFormat.Hm(locale.toString()).format(s.endTime);
            return AppCard(
              padding: const EdgeInsets.all(AppThemeData.paddingMd),
              child: Column(
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
                    context.localizations.minutesPluralWithNumber(s.duration.inMinutes),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
