import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/profile/profile_avatar.dart';
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
          imageSize: 96,
          textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
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
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          // fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(text: 'Completed '),
          TextSpan(
            text: '54',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ),
          TextSpan(text: ' minutes'),
        ]
      )
    );
  }

}
