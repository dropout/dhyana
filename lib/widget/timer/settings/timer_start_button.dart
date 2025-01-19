import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/util/painting.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:intl/intl.dart' as intl;
import 'package:vector_math/vector_math.dart' as vm;

class TimerStartButton extends StatefulWidget {

  final void Function() onTap;
  final FragmentShader fragmentShader;
  final TimerSettings timerSettings;

  const TimerStartButton({
    required this.onTap,
    required this.fragmentShader,
    required this.timerSettings,
    super.key
  });

  @override
  State<TimerStartButton> createState() => _TimerStartButtonState();
}

class _TimerStartButtonState extends State<TimerStartButton> with SingleTickerProviderStateMixin {

  // shader animation
  late final AnimationController _animationController;
  late final int _startTime;
  double get _elapsedTimeInSeconds => (_startTime - DateTime.now().millisecondsSinceEpoch) / 1000;

  // displaying the current time and the end time
  late final Timer _timer;
  final intl.DateFormat formatter = intl.DateFormat('H:mm');
  late DateTime now;
  late DateTime end;

  @override
  void initState() {

    _startTime = DateTime.now().millisecondsSinceEpoch;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.repeat();


    now = DateTime.now();
    end = now.add(widget.timerSettings.warmup + widget.timerSettings.duration);

    _timer = Timer.periodic(
      const Duration(minutes: 1),
          (Timer t) => setState(() {
        now = DateTime.now();
        end = now.add(widget.timerSettings.warmup + widget.timerSettings.duration);
      }),
    );

    super.initState();
  }

  Widget buildBg(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, _) {
            return CustomPaint(
              painter: ShaderPainter(
                shader: widget.fragmentShader,
                time: _elapsedTimeInSeconds,
              ),
            );
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.bloodRed,
      ),
      child: Stack(
        children: [

          // Background shape with gradient_flow shader
          // Positioned.fill will make the size of its child the same as its
          // siblings size, which is in this case the padding with text
          Positioned.fill(
            child: buildBg(context)
          ),

          // Text
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppThemeData.spacingXl,
              vertical: AppThemeData.spacingMd
            ),
            child: StartButtonText(
              buttonText: TextSpan(
                text: AppLocalizations.of(context).startTimerButtonText.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                )
              ),
            )
          ),

          // Inkwell effect
          Positioned.fill(
            child: Material(
              shape: const StadiumBorder(),
              color: Colors.transparent,
              child: InkWell(
                customBorder: const StadiumBorder(),
                splashColor: Colors.white.withAlpha(50),
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
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

}

class ShaderPainter extends CustomPainter {

  final FragmentShader shader;
  final double time;

  late final Paint _paint;
  late final Paint _blurPaint;

  ShaderPainter({
    required this.shader,
    required this.time,
  }) {
    _paint = Paint()
      ..shader = shader;

    _blurPaint = Paint()
      // ..color = Colors.black.withAlpha(96)
      ..color = AppColors.bloodRed.withAlpha(64)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(32));
  }

  @override
  void paint(Canvas canvas, Size size) {

    // we will only use 2 colors for now
    // primary red color
    Color color = AppColors.bloodRed;

    // darken the primary red color
    HSLColor accentColorHsl = HSLColor.fromColor(color);
    accentColorHsl = accentColorHsl.withLightness(accentColorHsl.lightness - 0.05);
    Color colorAccent = accentColorHsl.toColor();

    shader.setFloatUniforms((setter) {
      setter.setVector(vm.Vector2(size.width, size.height));
      setter.setFloat(time / 2);

      // colors: 0.0 - 1.0
      setter.setVectors([
        vm.Vector3(color.r, color.g, color.b),
        vm.Vector3(color.r, color.g, color.b),
        vm.Vector3(colorAccent.r, colorAccent.g, colorAccent.b),
        vm.Vector3(colorAccent.r, colorAccent.g, colorAccent.b),
      ]);
    });

    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(size.height / 2)),
      _blurPaint,
    );
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(size.height/2)), _paint);
  }

  @override
  bool shouldRepaint(ShaderPainter oldDelegate) =>
      shader != oldDelegate.shader ||
          time != oldDelegate.time;

}

class StartButtonText extends LeafRenderObjectWidget {

  final TextSpan buttonText;

  const StartButtonText({
    required this.buttonText,
    super.key,
  }) : super();

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStartButtonText(
      buttonText: buttonText,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderStartButtonText renderObject) {
    renderObject.buttonText = buttonText;
  }
}


class RenderStartButtonText extends RenderBox {

  TextSpan _buttonText;
  late final TextPainter _buttonTextPainter;

  RenderStartButtonText({
    required TextSpan buttonText,
  }) : _buttonText = buttonText {
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

    size = Size(
      _buttonTextPainter.width,
      _buttonTextPainter.height,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    _buttonTextPainter.paint(context.canvas, offset.translate((size.width - _buttonTextPainter.width) / 2, .0));
  }

}

