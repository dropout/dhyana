import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

class AddChantButton extends StatelessWidget {

  final VoidCallback onTap;

  const AddChantButton({
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      iconSize: 36,
      color: AppColors.buttonForeground,
      icon: const Icon(Icons.add_rounded),
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
      ),
    );
  }
}