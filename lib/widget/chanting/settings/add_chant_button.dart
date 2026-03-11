import 'package:flutter/material.dart';

class AddChantButton extends StatelessWidget {

  final VoidCallback onTap;

  const AddChantButton({
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 56,
      color: Colors.black,
      icon: const Icon(Icons.add_circle),
      onPressed: onTap,
    );
  }
}