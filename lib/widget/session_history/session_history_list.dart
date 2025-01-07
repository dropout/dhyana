import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
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
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingLg),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          sessions.map((s) => Card(
            color: AppColors.backgroundPaperLight,
            child: ListTile(
              title: buildSessionTitle(context, s),
              subtitle: buildSessionSubTitle(context, s),
            ),
          )).toList().intersperse(const Divider(height: 0))
        )
      ),
    );
  }

  Widget buildSessionTitle(BuildContext context, Session session) {
    Locale locale = Localizations.localeOf(context);
    final String when = '${DateFormat.yMMMMd(locale.toString()).format(session.startTime)} ${DateFormat.Hm(locale.toString()).format(session.startTime)}';
    return Text(when);
  }

  Widget buildSessionSubTitle(BuildContext context, Session session) {
    return Text(
      AppLocalizations.of(context)
        .minutesPluralWithNumber(session.duration.inMinutes)
    );
  }

}
