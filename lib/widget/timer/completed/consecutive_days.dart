import 'package:dhyana/model/profile.dart';
import 'package:flutter/material.dart';

class ConsecutiveDays extends StatefulWidget {

  final Profile profile;

  const ConsecutiveDays({
    required this.profile,
    super.key
  });

  @override
  State<ConsecutiveDays> createState() => _ConsecutiveDaysState();
}

class _ConsecutiveDaysState extends State<ConsecutiveDays> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.profile.stats.consecutiveDays.toString(),
          style: Theme.of(context).textTheme.displaySmall
        ),
        Text('consecutive days',
          style: Theme.of(context).textTheme.bodyLarge
        ),
      ],
    );
  }
}
