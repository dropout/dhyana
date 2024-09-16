import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

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
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: photoUrl,
        imageBuilder: (context, imageProvider) =>
          buildCircularImage(context, imageProvider),
        placeholder: (context, _) =>
          buildCircularImage(context, BlurHashImage(photoBlurhash)),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

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
