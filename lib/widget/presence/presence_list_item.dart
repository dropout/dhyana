import 'package:dhyana/model/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class PresenceListItem extends StatelessWidget {

  final Presence presence;
  final Color textColor;

  const PresenceListItem({
    required this.presence,
    this.textColor = Colors.black,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProfileImage(
              photoUrl: presence.profile.photoUrl,
              photoBlurhash: presence.profile.photoBlurhash,
              size: 56,
            ),
          ),
        ),
        Gap.small(),
        SizedBox(
          width: 56 + AppThemeData.spacingLg,
          child: Center(
            child: Text(
              presence.profile.firstName,
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Gap.medium(),
      ],
    );
  }
}
