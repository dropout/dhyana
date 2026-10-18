import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInCanvasText(
          text: '${DateFormat('MMMMd').format(today)}.',
          style: textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w800,
            height: 1.0,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 0),
          child: FadeInCanvasText(
            text: DateFormat('EEEE').format(today),
            style: textTheme.headlineMedium!.copyWith(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              height: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}

/// A reusable widget that manages the animation and layout
/// for the CustomPainter text effect.
class FadeInCanvasText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  /// What fraction of the total animation duration a single letter takes to fade.
  /// 0.15 means each letter takes 15% of the total [duration] to go from 0 to 1 opacity.
  final double letterAnimationFraction;

  const FadeInCanvasText({
    super.key,
    required this.text,
    required this.style,
    this.duration = const Duration(milliseconds: 1500),
    this.letterAnimationFraction = 0.15,
  });

  @override
  State<FadeInCanvasText> createState() => _FadeInCanvasTextState();
}

class _FadeInCanvasTextState extends State<FadeInCanvasText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Ghost Text: Invisible, but forces the parent Stack to
        // take up the exact dimensions and wrapping of the text.
        Opacity(opacity: 0.0, child: Text(widget.text, style: widget.style)),

        // 2. The Animated Canvas: Fills the bounds created by the ghost text.
        Positioned.fill(
          child: CustomPaint(
            painter: FadeInTextPainter(
              text: widget.text,
              style: widget.style,
              animation: _controller,
              letterAnimationFraction: widget.letterAnimationFraction,
            ),
          ),
        ),
      ],
    );
  }
}

/// The CustomPainter that calculates individual character opacities
/// and paints them to the canvas.
class FadeInTextPainter extends CustomPainter {
  final String text;
  final TextStyle style;
  final Animation<double> animation;
  final double letterAnimationFraction;

  FadeInTextPainter({
    required this.text,
    required this.style,
    required this.animation,
    required this.letterAnimationFraction,
  }) : super(
         repaint: animation,
       ); // Automatically triggers repaint when animation ticks

  @override
  void paint(Canvas canvas, Size size) {
    final textSpans = <TextSpan>[];
    final length = text.length;

    // Calculate the stagger delay between each character starting its fade
    final stagger = length > 1
        ? (1.0 - letterAnimationFraction) / (length - 1)
        : 0.0;

    for (int i = 0; i < length; i++) {
      final start = i * stagger;
      final end = start + letterAnimationFraction;

      double opacity = 0.0;
      if (animation.value >= end) {
        opacity = 1.0;
      } else if (animation.value <= start) {
        opacity = 0.0;
      } else {
        // Calculate linear opacity based on where the global animation is
        opacity = (animation.value - start) / (end - start);
        // Optional: Wrap in an ease curve
        opacity = Curves.easeOut.transform(opacity);
      }

      final baseColor = style.color ?? Colors.black;

      // Build the individual character with its specific opacity
      textSpans.add(
        TextSpan(
          text: text[i],
          style: style.copyWith(color: baseColor.withValues(alpha: opacity)),
        ),
      );
    }

    // Compose all characters into a single TextPainter
    final textPainter = TextPainter(
      text: TextSpan(children: textSpans),
      textDirection: .ltr,
    );

    // Layout using the width provided by the Stack (via the ghost text)
    textPainter.layout(maxWidth: size.width);
    textPainter.paint(canvas, Offset.zero);
  }

  @override
  bool shouldRepaint(FadeInTextPainter oldDelegate) {
    return text != oldDelegate.text ||
        style != oldDelegate.style ||
        letterAnimationFraction != oldDelegate.letterAnimationFraction;
    // Note: We don't need to check animation value changes here because
    // passing it to super(repaint: animation) handles it optimally.
  }
}
