import 'package:flutter/material.dart';

/// A widget that displays the current profile image in a circular shape.
class ProfileImagePickerCurrentImage extends StatelessWidget {
  final ImageProvider imageProvider;

  const ProfileImagePickerCurrentImage({
    required this.imageProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Durations.medium2,
      child: DecoratedBox(
        key: ValueKey<ImageProvider>(imageProvider),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 4.0),
          color: Colors.grey.shade400,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
        child: SizedBox.expand(),
      ),
    );
  }
}
