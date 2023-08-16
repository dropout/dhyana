import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhyana/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ProfileImage extends StatelessWidget {

  final String photoUrl;
  final String photoBlurhash;

  const ProfileImage({
    required this.photoUrl,
    required this.photoBlurhash,
    super.key
  });

  ProfileImage.fromProfile(Profile profile, {super.key}) :
    photoUrl = profile.photoUrl,
    photoBlurhash = profile.photoBlurhash;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover
          ),
        ),
      ),
      placeholder: (context, url) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: BlurHashImage(photoBlurhash),
              fit: BoxFit.cover
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

}
