import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityList extends StatefulWidget {

  final List<Session> sessions;

  const ActivityList({
    required this.sessions,
    super.key
  });

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.sessions.map((s) => ListTile(
        title: buildSessionTitle(context, s),
        subtitle: buildSessionSubTitle(context, s),
      )).toList().intersperse(const Divider(height: 0)),
    );
  }

  Widget buildSessionTitle(BuildContext context, Session session) {
    final String when = '${DateFormat.yMMMMd('hu_HU').format(session.startTime)} ${DateFormat.Hm('hu_HU').format(session.startTime)}';
    return Text(when);
  }

  Widget buildSessionSubTitle(BuildContext context, Session session) {
    final String lengthInMinutes = session.duration.inMinutes.toString();
    return Text('$lengthInMinutes perc');
  }

}
