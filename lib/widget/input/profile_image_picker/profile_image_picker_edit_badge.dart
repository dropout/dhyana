import 'package:flutter/material.dart';

/// A small circular edit indicator that appears on the profile image picker.
class ProfileImagePickerEditBadge extends StatelessWidget {
  final double indicatorSize;

  const ProfileImagePickerEditBadge({this.indicatorSize = 32.0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: indicatorSize,
      height: indicatorSize,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3.0),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Icon(Icons.edit, color: Colors.black, size: 16),
    );
  }
}