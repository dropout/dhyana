import 'package:dhyana/modules/social/domain/model/presence.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/modules/account/presentation/widget/profile_image.dart';
import 'package:dhyana/core/presentation/widget/util/gap.dart';
import 'package:flutter/material.dart';

class PresenceListItem extends StatelessWidget {

  final Presence presence;
  final Color textColor;
  final Color borderColor;

  const PresenceListItem({
    required this.presence,
    this.borderColor = Colors.black,
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
            color: borderColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProfileImage(
              profileName: presence.profile.displayName,
              profileImagePath: presence.profile.photoUrl,
              profilePhotoBlurhash: presence.profile.photoBlurhash,
              size: 56,
            ),
          ),
        ),
        Gap.small(),
        SizedBox(
          width: 56 + DesignSpec.spacingLg,
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
