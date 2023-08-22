import 'package:dhyana/model/all.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/profile/profile_image.dart';
import 'package:flutter/material.dart';

class PresenceListItem extends StatelessWidget {

  final Presence presence;

  const PresenceListItem({
    required this.presence,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileImage(
          photoUrl: presence.profile.photoUrl,
          photoBlurhash: presence.profile.photoBlurhash,
          size: 48,
        ),
        const SizedBox(height: AppThemeData.spacingSm),
        Text(
          presence.profile.firstName,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white,
            // fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
