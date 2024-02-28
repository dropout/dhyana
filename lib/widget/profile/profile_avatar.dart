import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {

  final Profile profile;
  final double imageSize;
  final TextStyle? textStyle;

  const ProfileAvatar({
    required this.profile,
    this.imageSize = DefaultProfileData.defaultProfileImageSize,
    this.textStyle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 4.0,
            ),
          ),
          child: ProfileImage.fromProfile(profile),
        ),
        const SizedBox(height: AppThemeData.spacingMd),
        buildName(context, profile.firstName, textStyle),
      ],
    );
  }

  Widget buildName(
    BuildContext context,
    String text,
    TextStyle? style
  ) {
    TextStyle s = style ?? Theme.of(context).textTheme.displaySmall!.copyWith(
      fontWeight: FontWeight.bold,
    );
    return Text(text, style: s);
  }

}
