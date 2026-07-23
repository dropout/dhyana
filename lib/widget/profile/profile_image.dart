import 'package:dhyana/modules/account/domain/model/profile_model.dart';
import 'package:dhyana/widget/profile/profile_image_placeholder.dart';
import 'package:dhyana/core/presentation/util/app_cached_network_image.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:flutter/material.dart';

/// A widget that displays a profile image for a given [ProfileModel].
/// If the profile has a valid image, it will be displayed. Otherwise, a
/// placeholder avatar with the first letter of the profile's display name
/// will be shown. The size of the image can be customized via the [size] parameter.
class ProfileImage extends StatelessWidget {
  /// The profile model containing the user's profile information.
  final ProfileModel profile;

  /// The size of the profile image. Defaults to [defaultSize].
  final double size;

  const ProfileImage({required this.profile, this.size = 96.0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('profile_image_sized_box'),
      width: size,
      height: size,
      child: switch (profile.hasProfileImage) {
        true => AppCachedNetworkImage(
          key: ValueKey(profile), // Rebuild when profile changes
          imagePath: profile.profileImagePath,
          blurHash: profile.photoBlurhash!,
          resourceResolver: context.services.resourceResolver,
          circular: true,
        ),
        false => ProfileImagePlaceholder(
          name: profile.displayName,
          backgroundColor: Colors.grey,
        ),
      },    
    );
  }

  // Maybe useful later...
  // Efficient way to create a circular image from any ImageProvider
  // No clipping involved
  Widget buildCircularImage(BuildContext context, ImageProvider imageProvider) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}
