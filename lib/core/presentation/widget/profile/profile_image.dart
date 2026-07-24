import 'package:dhyana/core/presentation/widget/profile/profile_image_placeholder.dart';
import 'package:dhyana/core/presentation/widget/util/app_cached_network_image.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:flutter/material.dart';

/// A widget that displays a profile image.
/// If [profileImagePath] is provided, it will display the image from 
/// the network.
/// If [profileImagePath] is null, it will display a placeholder with 
/// the user's initials.
/// If [profilePhotoBlurhash] is provided, it will be used to display a 
/// blurred version of the image while the network image is loading.
/// The size of the image can be customized via the [size] parameter.
class ProfileImage extends StatelessWidget {

  /// The name for the profile, for example, "John Doe". 
  /// This is used to generate initials for the placeholder.
  final String profileName;
  
  /// The profile image path in Firebase Storage.
  /// For ex.: `profiles/uid/profile.jpg`
  final String? profileImagePath;

  /// The blurhash for the profile image, if available.
  final String? profilePhotoBlurhash;

  /// The size of the profile image. Defaults to [defaultSize].
  final double size;

  // TODO: Clean up how the identity provider images will be used
  const ProfileImage({
    required this.profileName,
    required this.profileImagePath,
    required this.profilePhotoBlurhash,
    this.size = 96.0, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('profile_image_sized_box'),
      width: size,
      height: size,
      child: switch (profileImagePath != null) {
        true => AppCachedNetworkImage(
          imagePath: profileImagePath!,
          blurHash: profilePhotoBlurhash,
          resourceResolver: context.services.resourceResolver,
          circular: true,
        ),
        false => ProfileImagePlaceholder(
          name: profileName,
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
