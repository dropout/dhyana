import 'package:session/l10n/session_localizations.dart';
import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:session/src/public/model/session.dart';

/// Display the profile and the completed minutes count.
class const SessionResult({
  required final Session session,
  /// Can be null in case when user is not signed in.
  final Profile? profile,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (profile != null) ProfileAvatar(
          profileId: profile?.id ?? '',
          profileName: profile?.displayName ?? '',
          profilePhotoBlurhash: profile?.photoBlurhash,
          imageSize: DesignSpec.circleLg,
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (profile != null) SizedBox(height: DesignSpec.spacingMd),
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
            text: '${SessionLocalizations.of(context).sessionResultCompleted}  '
          ),
          TextSpan(
            text: session.duration.inMinutes.toString(),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ),
          TextSpan(
            text: '  ${SessionLocalizations.of(context).sessionResultMinutes(session.duration.inMinutes)}'
          ),
        ]
      )
    );
  }

}
