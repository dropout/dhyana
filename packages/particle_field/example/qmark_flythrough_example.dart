import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:particle_field/particle_field.dart';

void main() => runApp(const QMarkFlythroughExample());

/// A Material-free particle animation using only Flutter's widgets library.
class QMarkFlythroughExample extends StatelessWidget {
  const QMarkFlythroughExample({super.key});

  @override
  Widget build(BuildContext context) => const Directionality(
    textDirection: TextDirection.ltr,
    child: ColoredBox(
      color: Color(0xFFC2B280),
      child: _FlythroughScene(),
    ),
  );
}

class _FlythroughScene extends StatefulWidget {
  const new();
  @override
  State<_FlythroughScene> createState() => _FlythroughSceneState();
}

class _FlythroughSceneState extends State<_FlythroughScene>
    with SingleTickerProviderStateMixin {
  bool ready = false;

  late final QuestionMarkFlyThrough qMarkFlyThrough;
  late final ParticleController controller;
  late final ParticleCamera camera;
  late final ParticleRenderer renderer;

  @override
  void initState() {
    super.initState();

    final r = math.Random();
    qMarkFlyThrough = QuestionMarkFlyThrough(random: r);

    controller = ParticleController(
      vsync: this,
      system: qMarkFlyThrough.system,
    );

    camera = ParticleCamera(
      fovY: 90,
      distance: 400,
    );

    rootBundle.load('assets/q.png').then((imageByteData) async {
      final codec = await ui.instantiateImageCodec(
        imageByteData.buffer.asUint8List(),
      );
      final image = (await codec.getNextFrame()).image;

      renderer = AtlasRenderer3D(
        camera: camera,
        image: image,
        spriteSize: 32,        
      );

      if (!mounted) return;

      setState(() {
        print('Renderer is ready');
        ready = true;
      });

    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!ready) return const SizedBox.shrink();

    return Stack(
      fit: StackFit.expand,
      children: [ParticleField(controller: controller, renderer: renderer)],
    );
  }
}
