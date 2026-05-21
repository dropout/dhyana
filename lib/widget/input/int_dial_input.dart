import 'dart:math';

import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

/// A custom dial widget that allows users to select minutes for a duration.
class IntDialInput extends StatefulWidget {
  /// The maximum duration that can be selected using the dial.
  /// This will determine the scale of the dial.
  final int max;

  /// The minimum duration that can be selected using the dial.
  /// This will determine the starting point of the dial.
  final int min;

  /// The currently selected duration in minutes.
  /// This will determine the position of the dial's indicator.
  final int? selected;

  /// Callback when the duration changes.
  final ValueChanged<int>? onChanged;

  const IntDialInput({
    super.key,
    this.max = 60,
    this.min = 1,
    this.onChanged,
    this.selected,
  });

  @override
  State<IntDialInput> createState() => _IntDialInputState();
}

class _IntDialInputState extends State<IntDialInput> {
  final double _strokeWidth = 12.0;

  late int _currentDuration;

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.selected ?? 10;
  }

  void _onPanUpdate(DragUpdateDetails details, Size size) {
    // 1. Find the center of the dial
    final center = Offset(size.width / 2, size.height / 2);

    // 2. Get touch position relative to the center
    final touchPosition = details.localPosition - center;

    // 3. Calculate angle in radians (-pi to pi)
    double angle = atan2(touchPosition.dy, touchPosition.dx);

    // 4. Normalize angle to be between 0 and 2*pi (starting from the top, 12 o'clock)
    angle = (angle + pi / 2) % (2 * pi);

    // 5. Convert angle to a percentage (0.0 to 1.0)
    double percentage = angle / (2 * pi);

    // 6. Calculate your duration (min to max)
    int newDuration = ((widget.max - widget.min) * percentage).round() + widget.min;
    if (newDuration != _currentDuration) {
      setState(() {
        _currentDuration = newDuration;
      });
      widget.onChanged?.call(_currentDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        final radius =
            min(size.width, size.height) / 2 -
            27; // 24 is the stroke width of the dial
        return GestureDetector(
          behavior: .opaque,
          onPanUpdate: (details) => _onPanUpdate(details, size),
          child: Stack(
            fit: .expand,
            children: [

              // Draw the dial
              buildDial(context, size),

              // Draw a drag handle at the edge of the dial
              buildHandle(context, size, radius),

              // Draw a label in the center of the dial showing the selected duration
              buildLabel(context),

            ],
          ),
        );
      },
    );
  }

  Widget buildDial(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(DesignSpec.paddingXl),
      child: CustomPaint(
        painter: DialPainter(
          percentage: _currentDuration / widget.max,
          strokeWidth: _strokeWidth,
        ),
      ),
    );
  }

  Widget buildLabel(BuildContext context) {
    return Center(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: '$_currentDuration${context.l10n.minutesAbbr}',
              style: context.theme.textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHandle(BuildContext context, Size size, double radius) {
    final center = Offset(size.width / 2, size.height / 2);
    final angle = _currentDuration / widget.max * 2 * pi - pi / 2;
    final left = center.dx + radius * cos(angle) - 12;
    final top = center.dy + radius * sin(angle) - 12;

    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      ),
    );
  }
}

class DialPainter extends CustomPainter {
  final double strokeWidth;
  final double percentage; // Value between 0.0 and 1.0

  DialPainter({required this.percentage, required this.strokeWidth})
    : assert(
        percentage >= 0.0 && percentage <= 1.0,
        'Percentage must be between 0.0 and 1.0',
      );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    final backgroundPaint = Paint()
      ..color = AppColors.backgroundPaperLight
      ..style = PaintingStyle.fill
      ..strokeWidth = 24;

    final progressPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    // Draw background rectangle (for debugging)
    // canvas.drawRect(Offset.zero & size, Paint()..color = Colors.red.withValues(alpha: 0.5));

    // Draw background 360 circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw border around the dial
    canvas.drawCircle(
      center,
      radius - strokeWidth / 2,
      Paint()
        ..color = AppColors.backgroundPaperDark
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // Calculate the sweep angle for the progress arc based on the percentage
    double sweepAngle = percentage * 2 * pi;

    // Round the sweep angle to the nearest 6 degrees (1 minute on a 60-minute dial)
    double roundedSweepAngle =
        (sweepAngle / (2 * pi / 60)).round() * (2 * pi / 60);

    // Draw the progress arc with the rounded sweep angle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -pi / 2,
      roundedSweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant DialPainter oldDelegate) =>
      oldDelegate.percentage != percentage || oldDelegate.strokeWidth != strokeWidth;
}
