import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:particle_field/particle_field.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: GridWaveExample()),
);

/// Full-screen particle grid with an ocean-like z wave and a diagonal pulse.
class GridWaveExample extends StatefulWidget {
  const GridWaveExample({super.key});

  @override
  State<GridWaveExample> createState() => _GridWaveExampleState();
}

class _GridWaveExampleState extends State<GridWaveExample>
    with SingleTickerProviderStateMixin {
  static const _fov = pi / 3;
  static const _overscan = 1.5;

  final camera = ParticleCamera(fovY: _fov);
  ParticleController? _controller;
  AtlasRenderer3D? _renderer;
  Size? _size;

  // Grid density: particles spaced roughly this many logical px apart.
  double spacing = 64;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/q.png').then((imageByteData) async {
      final codec = await ui.instantiateImageCodec(
        imageByteData.buffer.asUint8List(),
      );
      final image = (await codec.getNextFrame()).image;
      if (!mounted) return;
      setState(() {
        _renderer = AtlasRenderer3D(
          image: image,
          camera: camera,
          spriteSize: 16,
          sort: false,
          // blendMode: BlendMode.plus,
        );
      });
    });
  }

  void _rebuild(Size size) {
    _size = size;
    final w = size.width * _overscan;
    final h = size.height * _overscan;
    final grid = GridParticles(
      width: w,
      height: h,
      columns: max(2, (w / spacing).round()),
      rows: max(2, (h / spacing).round()),
      rotation: 0.3,
      color: 0x887FD6FF,
      waveAmplitude: 45,
      waveSpeed: 0.15,
      waveFrequency: 0.5,      
      pulseSizeBoost: 0.1,
      pulsePeriod: 14.0,
      baseOpacity: 0.0,
      pulseWidth: 0.3,
    );
    // Distance at which the z = 0 plane fills the viewport height.
    camera.distance = size.height / 2 / tan(_fov / 2);
    _controller?.dispose();
    _controller = ParticleController(vsync: this, system: grid.system);
  }

  @override
  void dispose() {
    _controller?.dispose();
    camera.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          if (_size != size) _rebuild(size);
          return ParticleField(controller: _controller!, renderer: _renderer);
        },
      ),
    );
  }
}
