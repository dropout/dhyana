import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:dhyana/widgets/util/app_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ProfileImage extends StatelessWidget {

  final Profile profile;

  const ProfileImage({
    required this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: profile.photoUrl,
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
                image: BlurHashImage(profile.photoBlurhash),
                fit: BoxFit.cover
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

}
