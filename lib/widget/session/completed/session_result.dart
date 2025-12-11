import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:dhyana/widget/util/app_context.dart';
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
      mainAxisSize: MainAxisSize.min,
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
      key: const Key('session_result_completed_text'),
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: '${context.localizations.sessionResultCompleted} '
          ),
          TextSpan(
            text: session.duration.inMinutes.toString(),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ),
          TextSpan(
            text: '  ${context.localizations.sessionResultMinutes(session.duration.inMinutes)}'
          ),
        ]
      )
    );
  }

}
