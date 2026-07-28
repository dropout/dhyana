import 'package:flutter/material.dart';

// Efficient way to build circular images, without clipping
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
