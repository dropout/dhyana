import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  
  final String profileId;
  final String profileName;
  final double imageSize;

  final TextStyle? textStyle;
  final String? profilePhotoBlurhash;

  const ProfileAvatar({
    required this.profileId,
    required this.profileName,
    this.profilePhotoBlurhash,
    this.imageSize = 128.0,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          key: const Key('profile_avatar_sized_box'),
          width: imageSize,
          height: imageSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 4.0),
            ),
            child: ProfileImage(
              profileId: profileId,
              profileName: profileName,
              profilePhotoBlurhash: profilePhotoBlurhash,
              size: imageSize,
            ),
          ),
        ),
        const SizedBox(height: DesignSpec.spacingMd),
        buildName(context, profileName, textStyle),
      ],
    );
  }

  Widget buildName(BuildContext context, String text, TextStyle? style) {
    TextStyle st =
        style ??
        Theme.of(
          context,
        ).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold);
    return Text(text, key: const Key('profile_avatar_name_text'), style: st);
  }
}
