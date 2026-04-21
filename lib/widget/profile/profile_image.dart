import 'package:dhyana/model/profile_model.dart';
import 'package:dhyana/widget/util/app_cached_network_image.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

  static const defaultSize = 96.0;

  final ProfileModel profile;
  final double size;

  const ProfileImage({
    required this.profile,
    this.size = defaultSize,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('profile_image_sized_box'),
      width: size,
      height: size,
      child: AppCachedNetworkImage(
        imagePath: profile.profileImagePath,
        blurHash: profile.photoBlurhash,
        resourceResolver: context.services.resourceResolver,
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
