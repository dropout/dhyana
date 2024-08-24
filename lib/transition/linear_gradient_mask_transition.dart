import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:vector_math/vector_math.dart' as vm;

class LinearGradientMaskTransition extends AnimatedWidget {

  final Animation<double> progress;
  final Widget? child;
  final FragmentShader shader;

  const LinearGradientMaskTransition({
    required this.progress,
    required this.shader,
    this.child,
    super.key,
  }) : super(listenable: progress);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: ShaderMask(
        blendMode: BlendMode.xor,
        shaderCallback: (rect) {
          shader.setFloatUniforms((setter) {
            setter.setVector(vm.Vector2(rect.width, rect.height));
            setter.setFloat(progress.value);
          });
          return shader;
        },
        child: child,
      ),
    );
  }

}
