import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:flutter/material.dart';

class SessionResult extends StatefulWidget {

  final TimerState timerState;
  final Profile? profile;

  const SessionResult({
    required this.timerState,
    this.profile,
    super.key
  });

  @override
  State<SessionResult> createState() => _SessionResultState();
}

class _SessionResultState extends State<SessionResult> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ProfileAvatar(
          profile: widget.profile ?? Profile.anonymous(),
          imageSize: AppThemeData.circleLg,
          textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppThemeData.spacingMd),
        buildCompletedText(context, widget.timerState.elapsedTime),
      ],
    );

  }

  Widget buildCompletedText(BuildContext context, Duration timeElapsed) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
          // fontWeight: FontWeight.bold,
        ),
        children: [
          const TextSpan(text: 'Completed  '),
          TextSpan(
            text: widget.timerState.elapsedTime.inMinutes.toString(),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ),
          const TextSpan(text: '  minutes'),
        ]
      )
    );
  }

}
