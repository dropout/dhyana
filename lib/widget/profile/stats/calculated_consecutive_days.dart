import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:flutter/material.dart';

enum _State {
  calculating,
  completed,
  error,
}

class ConsecutiveDays extends StatefulWidget {

  final Profile profile;
  final ProfileBloc profileBloc;

  const ConsecutiveDays({
    required this.profile,
    required this.profileBloc,
    super.key
  });

  @override
  State<ConsecutiveDays> createState() => _ConsecutiveDaysState();
}

class _ConsecutiveDaysState extends State<ConsecutiveDays> {

  _State state = _State.calculating;

  @override
  void initState() {
    widget.profileBloc.add(ProfileEvent.calculateConsecutiveDays(
        profile: widget.profile,
        onComplete: (Profile profile) {
          setState(() {
            state = _State.completed;
            profile = profile;
          });
        },
        onError: (_, __) {
          setState(() {
            state = _State.error;
          });
        }
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case _State.calculating:
        return buildCalculating(context);
      case _State.completed:
        return buildCompleted(context);
      case _State.error:
        return buildError(context);
    }
  }

  Widget buildCalculating(BuildContext context) {
    return Text('calculating');
  }

  Widget buildCompleted(BuildContext context) {
    final int consecutiveDays = widget.profile.stats.consecutiveDays;
    return Column(
      children: [
        Text(consecutiveDays.toString(),
            style: Theme.of(context).textTheme.displaySmall
        ),
        Text('consecutive days',
            style: Theme.of(context).textTheme.bodyLarge
        ),
      ],
    );
  }

  Widget buildError(BuildContext context) {
    return Text('error occured');
  }

}
