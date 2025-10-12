import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:dhyana/widget/util/app_cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

  static const defaultSize = 96.0;

  final String photoUrl;
  final String photoBlurhash;
  final double size;

  const ProfileImage({
    required this.photoUrl,
    required this.photoBlurhash,
    this.size = defaultSize,
    super.key
  });

  ProfileImage.fromProfile(Profile profile, {
    this.size=defaultSize,
    super.key
  }) :
    photoUrl = profile.photoUrl,
    photoBlurhash = profile.photoBlurhash;

  const ProfileImage.anonymous({
    this.size=defaultSize,
    super.key
  }) :
    photoUrl = DefaultProfileData.photoUrl,
    photoBlurhash = DefaultProfileData.photoBlurhash;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('profile_image_sized_box'),
      width: size,
      height: size,
      child: AppCachedNetworkImage(
        imageUrl: Future.value(photoUrl),
        blurHash: photoBlurhash,
        circular: true,
      ),
    );
  }

  // Maybe useful later...
  // Efficient way to create a circular image from any ImageProvider
  // No clipping involved
  Widget buildCircularImage(BuildContext context, ImageProvider imageProvider) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover
        ),
      ),
    );
  }

}
