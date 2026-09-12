import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:core/src/presentation/view/util/shader_rendering_scope.dart';
import 'package:core/src/util/assets.dart';

/// Renders a procedurally generated, continuously scrolling parchment
/// paper texture behind [child], driven by [scrollOffset].
/// [seed] deterministically varies the base pattern without affecting scrolling.
class ParchmentBackground extends StatelessWidget {
  final Widget child;
  final ValueListenable<double> scrollOffset;
  final double seed;

  const ParchmentBackground({
    required this.child,
    required this.scrollOffset,
    this.seed = 0.0,
    super.key,
  });

  Widget buildBg(BuildContext context) {
    if (!ShaderRenderingScope.isEnabled(context)) {
      return const ColoredBox(color: Color(0xFFF3E5AB));
    }

    final shader = context.services.shaderService.get(
      Assets.shaderParchmentNoise,
    );

    return RepaintBoundary(
      child: ValueListenableBuilder<double>(
        valueListenable: scrollOffset,
        builder: (context, offset, _) {
          return CustomPaint(
            painter: _ParchmentShaderPainter(
              shader: shader,
              scrollOffset: offset,
              seed: seed,
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
        Positioned.fill(child: child),
      ],
    );
  }
}

class _ParchmentShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final double scrollOffset;
  final double seed;
  late final Paint _paint;

  _ParchmentShaderPainter({
    required this.shader,
    required this.scrollOffset,
    required this.seed,
  }) {
    _paint = Paint()..shader = shader;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // vec2 u_size occupies indices 0-1, float u_scroll_offset is index 2, u_seed is index 3
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, scrollOffset);
    shader.setFloat(3, seed);

    canvas.drawRect(Offset.zero & size, _paint);
  }

  @override
  bool shouldRepaint(covariant _ParchmentShaderPainter oldDelegate) =>
      oldDelegate.scrollOffset != scrollOffset || oldDelegate.seed != seed;
}
