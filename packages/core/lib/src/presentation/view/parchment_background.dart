import 'dart:ui';

import 'package:core/src/presentation/design_spec.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:core/src/presentation/view/util/shader_rendering_scope.dart';
import 'package:core/src/util/assets.dart';

/// Renders a procedurally generated, continuously scrolling parchment
/// paper texture behind [child], driven by [scrollOffset].
/// [seed] deterministically varies the base pattern without affecting scrolling.
class ParchmentBackground extends StatelessWidget {

  static final ValueNotifier<double> _defaultScrollOffset = ValueNotifier(0.0);

  final Widget? child;
  final ValueListenable<double>? scrollOffset;
  final double seed;

  const ParchmentBackground({
    this.child,
    this.scrollOffset,
    this.seed = 0.0,
    super.key,
  });

  Widget buildBg(BuildContext context) {
    if (!ShaderRenderingScope.isEnabled(context)) {
      return const ColoredBox(color: AppColors.backgroundPaper);
    }

    final shader = context.services.shaderService.get(
      Assets.shaderParchmentNoise,
    );

    final screenSize = MediaQuery.of(context).size;
    const downscaleFactor = 4.0;

    return RepaintBoundary(
      child: ValueListenableBuilder<double>(
        valueListenable: scrollOffset ?? _defaultScrollOffset,
        builder: (context, offset, _) {
          return FittedBox(
            fit: .fill,
            child: SizedBox(
              width: screenSize.width / downscaleFactor,
              height: screenSize.height / downscaleFactor,
              child: CustomPaint(
                painter: _ParchmentShaderPainter(
                  shader: shader,
                  scrollOffset: offset,
                  seed: seed,
                  displaySize: screenSize,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: buildBg(context)),
        Positioned.fill(child: child ?? SizedBox.shrink()),
      ],
    );
  }
}

class _ParchmentShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final double scrollOffset;
  final double seed;
  final Size displaySize;
  late final Paint _paint;

  _ParchmentShaderPainter({
    required this.shader,
    required this.scrollOffset,
    required this.seed,
    required this.displaySize,
  }) {
    _paint = Paint()..shader = shader;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // u_size: 0-1, u_display_size: 2-3, u_scroll_offset: 4, u_seed: 5.
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, displaySize.width);
    shader.setFloat(3, displaySize.height);
    shader.setFloat(4, scrollOffset);
    shader.setFloat(5, seed);

    canvas.drawRect(Offset.zero & size, _paint);
  }

  @override
  bool shouldRepaint(covariant _ParchmentShaderPainter oldDelegate) =>
      oldDelegate.scrollOffset != scrollOffset ||
      oldDelegate.seed != seed ||
      oldDelegate.displaySize != displaySize;
}
