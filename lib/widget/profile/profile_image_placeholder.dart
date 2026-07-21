import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

/// A profile image placeholder widget that takes a name and displays 
/// a circular avatar with a randomized background color 
/// from a list of predefined colors. 
///
/// The placeholder displays the first letter of
/// the profile's  name in uppercase.
class ProfileImagePlaceholder extends StatelessWidget {

  /// The name to be displayed in the placeholder.
  final String name;

  /// The background color of the placeholder. If not provided, a random color
  /// from the predefined list will be used.
  final Color? backgroundColor;

  const ProfileImagePlaceholder({
    required this.name,
    this.backgroundColor,
    super.key,
  });

  /// A list of predefined colors to be used as background colors 
  /// for the placeholder.
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
    final index = name.hashCode % _defaultColors.length;
    return _defaultColors[index.abs()];
  }

  @override
  Widget build(BuildContext context) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
    
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
                fontSize: 100, // Set large enough to scale down
                fontWeight: FontWeight.bold,
              ),        
            ),
          ),
        ),
      ),
    );
  }
}


