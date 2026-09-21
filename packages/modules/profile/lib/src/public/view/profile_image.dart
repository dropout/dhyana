import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/src/public/view/profile_image_placeholder.dart';

/// A widget that displays a profile image.
/// If [profilePhotoBlurhash] is not provided or the image fails to load, 
/// it will display a placeholder with the user's initials.
/// If [profilePhotoBlurhash] is provided, it will be used to display a 
/// blurred version of the image while the network image is loading.
/// The idea here is that when the profile image stored the blurhash in the profile
/// is also generated, so one can assume if there is no blurhash available, the profile image is not set.
class const ProfileImage({
  required final String profileId,
  required final String profileName,
  final String? profilePhotoBlurhash,
  final double size = 96.0,
  final ImageProvider? imageProvider,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('profile_image_sized_box'),
      width: size,
      height: size,
      child: switch (profilePhotoBlurhash != null) {
        true => AppCachedNetworkImage(
          imagePath: '/profiles/$profileId/photo.jpg',
          blurHash: profilePhotoBlurhash,
          resourceResolver: context.services.resourceResolver,
          circular: true,
          errorWidget: ProfileImagePlaceholder(
            name: profileName,
          ),
          imageProvider: imageProvider,
        ),
        false => ProfileImagePlaceholder(
          name: profileName,
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
