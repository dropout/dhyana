import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:particle_field/particle_field.dart';

class _Host extends StatefulWidget {
  const _Host(this.system, this.renderer, {this.onController});
  final ParticleSystem system;
  final ParticleRenderer renderer;
  final void Function(ParticleController)? onController;

  @override
  State<_Host> createState() => _HostState();
}

class _HostState extends State<_Host> with SingleTickerProviderStateMixin {
  late final ParticleController c = ParticleController(
    vsync: this,
    system: widget.system,
  );

  @override
  void initState() {
    super.initState();
    widget.onController?.call(c);
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.ltr,
    child: ParticleField(controller: c, renderer: widget.renderer),
  );
}

void main() {
  testWidgets('ticks with real dt and paints at the aligned origin', (
    tester,
  ) async {
    final system = ParticleSystem(random: Random(1));
    system.spawn(vx: 100, life: 10);
    Offset? painted;
    Size? size;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 200,
            height: 100,
            child: _Host(
              system,
              CallbackRenderer((canvas, s, b) {
                size = s;
                painted = Offset(b.px[0], b.py[0]);
              }),
            ),
          ),
        ),
      ),
    );
    await tester.pump(); // first tick, dt = 0
    await tester.pump(const Duration(milliseconds: 40));
    expect(size, const ui.Size(200, 100));
    expect(painted!.dx, closeTo(4, 1e-3));
    expect(system.time, closeTo(0.04, 1e-6));
  });

  testWidgets('stop pauses and start resumes without a dt jump', (
    tester,
  ) async {
    final system = ParticleSystem();
    system.spawn(vx: 100, life: 100);
    late ParticleController c;
    await tester.pumpWidget(
      _Host(system, PointsRenderer(), onController: (x) => c = x),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 20));
    final x0 = system.buffers.px[0];
    c.stop();
    await tester.pump(const Duration(seconds: 5));
    expect(system.buffers.px[0], x0);
    c.start();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 20));
    expect(system.buffers.px[0] - x0, closeTo(2, 1e-3));
  });

  testWidgets('emitAt spawns and toParticleSpace converts', (tester) async {
    final system = ParticleSystem();
    late ParticleController c;
    await tester.pumpWidget(
      _Host(system, PointsRenderer(), onController: (x) => c = x),
    );
    c.emitAt(const ParticleTemplate(), 5, 6, count: 3);
    expect(system.count, 3);
    expect(
      ParticleField.toParticleSpace(
        const Offset(100, 50),
        const Size(200, 100),
        Alignment.center,
      ),
      Offset.zero,
    );
    c.clear();
    expect(system.count, 0);
  });
}
