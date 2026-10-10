import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:particle_field/particle_field.dart';
import 'package:particle_field/particle_field_gpu.dart';

/// 3D fireworks and a curl-noise cloud; drag to orbit, pinch to zoom.
class Demo3D extends StatefulWidget {
  const Demo3D({super.key});

  @override
  State<Demo3D> createState() => _Demo3DState();
}

enum _Backend { cpu, gpu }

class _Demo3DState extends State<Demo3D> with SingleTickerProviderStateMixin {
  final fireworks = Fireworks(
    spherical: true,
    gravity: 120,
    maxParticles: 8192,
  );
  final camera = ParticleCamera(distance: 700, pitch: 0.25);
  late final ParticleController controller;
  Timer? _timer;
  double _startDistance = 700;

  AtlasRenderer3D? _cpu;
  GpuParticleRenderer? _gpu;
  _Backend _backend = _Backend.cpu;

  @override
  void initState() {
    super.initState();
    fireworks.system.forces.add(
      VectorFieldForce(
        const CurlNoiseField(frequency: 0.012, amplitude: 25),
        mode: VectorFieldMode.acceleration,
      ),
    );
    controller = ParticleController(vsync: this, system: fireworks.system);
    _timer = Timer.periodic(
      const Duration(milliseconds: 900),
      (_) => _launch(),
    );
    createSoftCircleImage(diameter: 32).then((image) async {
      final gpu = await GpuParticleRenderer.tryCreate(
        sprite: image,
        camera: camera,
        spriteSize: 12,
      );
      if (!mounted) return;
      setState(() {
        _cpu = AtlasRenderer3D(
          image: image,
          camera: camera,
          spriteSize: 12,
          sort: false,
          blendMode: BlendMode.plus,
        );
        _gpu = gpu;
      });
    });
  }

  void _launch() {
    final r = Random();
    fireworks.launch(
      r.nextDouble() * 300 - 150,
      200,
      z: r.nextDouble() * 300 - 150,
      apexY: -120 + r.nextDouble() * 60,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    camera.dispose();
    _gpu?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final renderer = _backend == _Backend.gpu ? _gpu : _cpu;
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onScaleStart: (_) => _startDistance = camera.distance,
          onScaleUpdate: (d) {
            camera.orbit(
              -d.focalPointDelta.dx * 0.01,
              d.focalPointDelta.dy * 0.01,
            );
            camera.distance = _startDistance / d.scale;
          },
          child: ColoredBox(
            color: Colors.black,
            child: ParticleField(controller: controller, renderer: renderer),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: SegmentedButton<_Backend>(
            segments: [
              const ButtonSegment(value: _Backend.cpu, label: Text('CPU')),
              ButtonSegment(
                value: _Backend.gpu,
                label: const Text('Flutter GPU'),
                enabled: _gpu != null,
              ),
            ],
            selected: {_backend},
            onSelectionChanged: (s) => setState(() => _backend = s.first),
          ),
        ),
      ],
    );
  }
}
