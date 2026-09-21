import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:profile/src/public/view/profile_image.dart';

class const ProfileAvatar({
  /// Used for loading the profile photo from storage.
  required final String profileId,
  /// The name of the profile, used for displaying initials in the placeholder.
  required final String profileName,
  final double imageSize = 128.0,
  /// Styles for the name text displayed below the profile image.
  final TextStyle? textStyle,
  /// If no profile photo blurhash is provided, the placeholder will be used.
  final String? profilePhotoBlurhash,
  /// Useful in tests and widgetbook scenarios.
  final ImageProvider? profileImageProvider,
  super.key,
}) extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
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
              imageProvider: profileImageProvider,
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
    TextStyle st = style ??
      Theme.of(context).textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.bold
      );
    return Text(text, key: const Key('profile_avatar_name_text'), style: st);
  }

}
