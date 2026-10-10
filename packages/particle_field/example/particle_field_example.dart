import 'dart:math';

import 'package:flutter/material.dart';
import 'package:particle_field/particle_field.dart';

import 'demo_3d.dart';

void main() => runApp(const ParticleFieldExampleApp());

class ParticleFieldExampleApp extends StatelessWidget {
  const ParticleFieldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Particle Field Example',
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Particle Field'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Fireworks'),
                Tab(text: 'Flow field'),
                Tab(text: 'Burst'),
                Tab(text: '3D'),
              ],
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [FireworksDemo(), FlowFieldDemo(), BurstDemo(), Demo3D()],
          ),
        ),
      ),
    );
  }
}

/// Tap anywhere to launch a rocket towards the tap position.
class FireworksDemo extends StatefulWidget {
  const FireworksDemo({super.key});

  @override
  State<FireworksDemo> createState() => _FireworksDemoState();
}

class _FireworksDemoState extends State<FireworksDemo>
    with SingleTickerProviderStateMixin {
  final fireworks = Fireworks();
  late final ParticleController controller;
  AtlasRenderer? renderer;

  @override
  void initState() {
    super.initState();
    controller = ParticleController(vsync: this, system: fireworks.system);
    createSoftCircleImage(diameter: 32).then((image) {
      if (!mounted) return;
      setState(() {
        renderer = AtlasRenderer(
          image: image,
          spriteSize: 10,
          blendMode: BlendMode.plus,
        );
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
    return LayoutBuilder(
      builder: (context, c) {
        final size = c.biggest;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (d) {
            final tap = ParticleField.toParticleSpace(
              d.localPosition,
              size,
              Alignment.center,
            );
            fireworks.launch(
              Random().nextDouble() * 80 - 40 + tap.dx,
              size.height / 2,
              apexY: tap.dy,
            );
          },
          child: ColoredBox(
            color: Colors.black,
            child: ParticleField(controller: controller, renderer: renderer),
          ),
        );
      },
    );
  }
}

/// Continuous emitter pushed around by a time-varying vector field.
class FlowFieldDemo extends StatefulWidget {
  const FlowFieldDemo({super.key});

  @override
  State<FlowFieldDemo> createState() => _FlowFieldDemoState();
}

class _FlowFieldDemoState extends State<FlowFieldDemo>
    with SingleTickerProviderStateMixin {
  late final ParticleController controller;

  @override
  void initState() {
    super.initState();
    final system = ParticleSystem(
      maxParticles: 3000,
      emitters: [
        RateEmitter(
          rate: 400,
          template: const ParticleTemplate(
            shape: LineShape(-160, -200, 160, -200),
            direction: pi / 2,
            spread: 0.6,
            minSpeed: 20,
            maxSpeed: 60,
            minLife: 3,
            maxLife: 5,
            colorPicker: _pickColor,
          ),
        ),
      ],
      forces: [
        VectorFieldForce(
          FunctionVectorField.planar(_swirl),
          mode: VectorFieldMode.acceleration,
          strength: 80,
          response: 1.5,
        ),
        const Attractor(strength: 120, radius: 140),
      ],
      behaviors: const [FadeOut(), ScaleOverLife(start: 1, end: 0.3)],
    );
    controller = ParticleController(vsync: this, system: system);
  }

  static int _pickColor(Random r) => r.nextBool() ? 0xFF40C4FF : 0xFFB388FF;

  static void _swirl(double x, double y, double t, FieldSample o) {
    o.dx = sin(y * 0.02 + t) + cos(x * 0.015 - t * 0.7);
    o.dy = cos(x * 0.02 + t * 0.5) - sin(y * 0.01);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: ParticleField(
        controller: controller,
        renderer: PerParticleRenderer((canvas, b, i) {
          canvas.drawCircle(
            Offset(b.px[i], b.py[i]),
            3 * b.size[i],
            Paint()..color = Color(b.color[i]),
          );
        }),
      ),
    );
  }
}

/// Port of the original effect, retriggered on tap.
class BurstDemo extends StatefulWidget {
  const BurstDemo({super.key});

  @override
  State<BurstDemo> createState() => _BurstDemoState();
}

class _BurstDemoState extends State<BurstDemo>
    with SingleTickerProviderStateMixin {
  final burst = ShrinkingBurst(maxParticles: 256);
  late final ParticleController controller = ParticleController(
    vsync: this,
    system: burst.system,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => burst.emit(count: 64),
      child: ParticleField(controller: controller, renderer: burst.renderer),
    );
  }
}
