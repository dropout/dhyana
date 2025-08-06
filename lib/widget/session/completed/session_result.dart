import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:flutter/material.dart';

class SessionResult extends StatelessWidget {

  final Session session;
  final Profile? profile;

  const SessionResult({
    required this.session,
    this.profile,
    super.key
  });


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ProfileAvatar(
          profile: profile ?? Profile.anonymous(),
          imageSize: AppThemeData.circleLg,
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppThemeData.spacingMd),
        buildCompletedText(context, session.duration),
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
            text: session.duration.inMinutes.toString(),
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
