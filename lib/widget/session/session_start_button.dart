import 'dart:ui';

import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:vector_math/vector_math.dart' as vm;

class SessionStartButton extends StatefulWidget {
  final void Function() onTap;
  final FragmentShader fragmentShader;
  final Color colorA;
  final Color colorB;

  const SessionStartButton({
    required this.onTap,
    required this.fragmentShader,
    this.colorA = AppColors.red,
    this.colorB = AppColors.redAccent,
    super.key,
  });

  @override
  State<SessionStartButton> createState() => _SessionStartButtonState();
}

class _SessionStartButtonState extends State<SessionStartButton>
    with SingleTickerProviderStateMixin {
  // shader animation
  late final AnimationController _animationController;
  late final int _startTime;
  double get _elapsedTimeInSeconds =>
      (_startTime - DateTime.now().millisecondsSinceEpoch) / 1000;

  @override
  void initState() {
    _startTime = DateTime.now().millisecondsSinceEpoch;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.repeat();

    super.initState();
  }

  Widget buildBg(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, _) {
          return CustomPaint(
            painter: ShaderPainter(
              colorA: widget.colorA,
              colorB: widget.colorB,
              shader: widget.fragmentShader,
              time: _elapsedTimeInSeconds,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(shape: StadiumBorder(), color: AppColors.red),
      child: Stack(
        children: [
          // Background shape with gradient_flow shader
          // Positioned.fill will make the size of its child the same as its
          // siblings size, which is in this case the padding with text
          Positioned.fill(child: buildBg(context)),

          // Text
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpec.spacingXl,
              vertical: DesignSpec.spacingMd,
            ),
            child: Text(
              context.l10n.startTimerButtonText.toUpperCase(),
              style: context.theme.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          // Inkwell effect
          Positioned.fill(
            child: Material(
              shape: const StadiumBorder(),
              color: Colors.transparent,
              child: InkWell(
                customBorder: const StadiumBorder(),
                onTap: widget.onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final double time;
  final Color colorA;
  final Color colorB;
  late final Paint _paint;

  ShaderPainter({required this.shader, required this.time, required this.colorA, required this.colorB}) {
    _paint = Paint()..shader = shader;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // we will only use 2 colors for now
    // primary red color
    Color color = colorA;
    Color colorAccent = colorB;

    shader.setFloatUniforms((setter) {
      setter.setVector(vm.Vector2(size.width, size.height));
      setter.setFloat(time);

      // colors: 0.0 - 1.0
      setter.setVectors([
        vm.Vector3(color.r, color.g, color.b),
        vm.Vector3(colorAccent.r, colorAccent.g, colorAccent.b),
        vm.Vector3(color.r, color.g, color.b),
        vm.Vector3(colorAccent.r, colorAccent.g, colorAccent.b),
      ]);
    });

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(size.height / 2),
      ),
      _paint,
    );
  }

  @override
  bool shouldRepaint(ShaderPainter oldDelegate) =>
      shader != oldDelegate.shader || time != oldDelegate.time;
}

class StartButtonText extends LeafRenderObjectWidget {
  final TextSpan buttonText;

  const StartButtonText({required this.buttonText, super.key}) : super();

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStartButtonText(buttonText: buttonText);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderStartButtonText renderObject,
  ) {
    renderObject.buttonText = buttonText;
  }
}

class RenderStartButtonText extends RenderBox {
  TextSpan _buttonText;
  late final TextPainter _buttonTextPainter;

  RenderStartButtonText({required TextSpan buttonText})
    : _buttonText = buttonText {
    _buttonTextPainter = TextPainter(
      text: buttonText,
      textDirection: TextDirection.ltr,
    )..layout();
  }

  TextSpan get buttonText => _buttonText;
  set buttonText(TextSpan text) {
    if (_buttonTextPainter.text != text) {
      _buttonTextPainter.text = text;
      _buttonTextPainter.layout();
      _buttonText = text;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    _buttonTextPainter.layout();

    size = Size(_buttonTextPainter.width, _buttonTextPainter.height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    _buttonTextPainter.paint(
      context.canvas,
      offset.translate((size.width - _buttonTextPainter.width) / 2, .0),
    );
  }
}
