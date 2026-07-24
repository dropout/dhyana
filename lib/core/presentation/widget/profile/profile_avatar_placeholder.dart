import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:flutter/material.dart';

/// A profile avatar placeholder widget that takes a [Profile] model
/// and displays a circular avatar with a randomized background color 
/// from a list of predefined colors. 
///
/// The avatar displays the first letter of the profile's first name in uppercase.
class ProfileImagePlaceholder extends StatelessWidget {
  final String firstName;
  final Color? backgroundColor;

  const ProfileImagePlaceholder({
    required this.firstName,
    this.backgroundColor,
    super.key,
  });

  static const List<Color> _defaultColors = [
    Color(0xFF6C63FF),
    Color(0xFFFF6B6B),
    Color(0xFF4ECDC4),
    Color(0xFFFFE66D),
    Color(0xFF95E1D3),
    Color(0xFFC7CEEA),
  ];

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    final index = firstName.hashCode % _defaultColors.length;
    return _defaultColors[index.abs()];
  }

  @override
  Widget build(BuildContext context) {
    final initial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '?';
    
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getBackgroundColor(),
      ),
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(DesignSpec.paddingXs),
          child: FittedBox(        
            fit: .scaleDown,
            child: Text(
              initial,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),        
            ),
          ),
        ),
      ),
    );
  }
}


