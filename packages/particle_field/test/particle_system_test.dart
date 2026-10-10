import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:particle_field/particle_field.dart';

ParticleSystem _system({int max = 8}) =>
    ParticleSystem(maxParticles: max, random: Random(1));

void main() {
  group('ParticleBuffers', () {
    test('respects capacity', () {
      final b = ParticleBuffers(2);
      expect(b.add(), 0);
      expect(b.add(), 1);
      expect(b.add(), -1);
      expect(b.count, 2);
    });

    test('swap-remove keeps live range packed and moves all channels', () {
      final b = ParticleBuffers(4, customChannels: 1);
      for (var i = 0; i < 3; i++) {
        final k = b.add(x: i.toDouble(), kind: i);
        b.custom[0][k] = i * 10.0;
      }
      b.removeAt(0);
      expect(b.count, 2);
      expect(b.px[0], 2);
      expect(b.kind[0], 2);
      expect(b.custom[0][0], 20);
      expect(b.px[1], 1);
    });
  });

  group('ParticleSystem', () {
    test('integrates position with dt', () {
      final s = _system();
      s.spawn(vx: 100, vy: -50, life: 10);
      s.step(0.05);
      s.step(0.05);
      expect(s.buffers.px[0], closeTo(10, 1e-4));
      expect(s.buffers.py[0], closeTo(-5, 1e-4));
      expect(s.buffers.age[0], closeTo(0.1, 1e-6));
    });

    test('clamps large dt', () {
      final s = _system();
      s.spawn(vx: 100, life: 10);
      s.step(5);
      expect(s.buffers.px[0], closeTo(100 * s.maxDt, 1e-4));
    });

    test('removes dead particles and keeps survivors', () {
      final s = _system();
      s.spawn(life: 0.01, x: 1);
      s.spawn(life: 10, x: 2);
      s.spawn(life: 0.01, x: 3);
      s.step(0.02);
      expect(s.count, 1);
      expect(s.buffers.px[0], 2);
    });

    test('onDeath can spawn children that survive the same step', () {
      final s = _system();
      s.onDeath = (sys, i) {
        for (var k = 0; k < 3; k++) {
          sys.spawn(x: sys.buffers.px[i], life: 5, kind: 1);
        }
      };
      s.spawn(life: 0.01);
      s.spawn(life: 0.01);
      s.step(0.02);
      expect(s.count, 6);
      expect(List.generate(6, (i) => s.buffers.kind[i]), everyElement(1));
      expect(s.buffers.age.sublist(0, 6), everyElement(0));
    });

    test('same seed gives identical results', () {
      List<double> run() {
        final s = ParticleSystem(random: Random(42));
        s.emitters.add(
          RateEmitter(
            template: const ParticleTemplate(shape: CircleShape(10)),
            rate: 100,
          ),
        );
        for (var i = 0; i < 30; i++) {
          s.step(1 / 60);
        }
        return s.buffers.px.sublist(0, s.count).toList();
      }

      expect(run(), run());
    });
  });

  group('Emitters', () {
    test('rate emitter keeps fractional carry', () {
      final s = _system(max: 100);
      s.emitters.add(
        RateEmitter(
          template: const ParticleTemplate(minLife: 100, maxLife: 100),
          rate: 10,
        ),
      );
      for (var i = 0; i < 60; i++) {
        s.step(1 / 60);
      }
      expect(s.count, inInclusiveRange(9, 10));
    });

    test('burst emitter fires count then stops', () {
      final s = _system(max: 100);
      s.emitters.add(
        BurstEmitter(
          template: const ParticleTemplate(minLife: 100, maxLife: 100),
          count: 7,
        ),
      );
      for (var i = 0; i < 120; i++) {
        s.step(1 / 60);
      }
      expect(s.count, 7);
    });

    test('radial template emits away from origin', () {
      final s = _system();
      const ParticleTemplate(
        shape: CircleShape(10, edgeOnly: true),
        radial: true,
        minSpeed: 5,
        maxSpeed: 5,
      ).spawnAt(s, 0, 0);
      final b = s.buffers;
      expect(b.vx[0] * b.px[0] + b.vy[0] * b.py[0], greaterThan(0));
    });
  });

  group('Forces', () {
    test('gravity accelerates', () {
      final s = _system()..forces.add(const Gravity(y: 100));
      s.spawn(life: 10);
      s.step(0.05);
      expect(s.buffers.vy[0], closeTo(5, 1e-4));
    });

    test('drag is framerate independent', () {
      double speedAfter(int steps) {
        final s = _system()..forces.add(const Drag(coefficient: 2));
        s.spawn(vx: 100, life: 10);
        for (var i = 0; i < steps; i++) {
          s.step(1 / steps);
        }
        return s.buffers.vx[0];
      }

      expect(speedAfter(40), closeTo(speedAfter(20), 1e-3));
      expect(speedAfter(20), closeTo(100 * exp(-2), 1e-2));
    });

    test('kind mask limits forces', () {
      final s = _system()..forces.add(const Gravity(y: 100, kindMask: 1 << 1));
      s.spawn(life: 10, kind: 0);
      s.spawn(life: 10, kind: 1);
      s.step(0.05);
      expect(s.buffers.vy[0], 0);
      expect(s.buffers.vy[1], greaterThan(0));
    });

    test('attractor pulls toward point and ignores outside radius', () {
      final s = _system()
        ..forces.add(const Attractor(x: 100, strength: 100, radius: 150));
      s.spawn(x: 0, life: 10);
      s.spawn(x: -200, life: 10);
      s.step(0.05);
      expect(s.buffers.vx[0], greaterThan(0));
      expect(s.buffers.vx[1], 0);
    });

    test('vortex is tangential', () {
      final s = _system()..forces.add(const Vortex(strength: 100, radius: 100));
      s.spawn(x: 50, life: 10);
      s.step(0.05);
      expect(s.buffers.vx[0], closeTo(0, 1e-6));
      expect(s.buffers.vy[0], greaterThan(0));
    });
  });

  group('VectorField', () {
    test('grid samples bilinearly and is zero outside', () {
      final field = GridVectorField(
        bounds: const FieldBounds(0, 0, 10, 10),
        columns: 2,
        rows: 2,
        data: Float32List.fromList([0, 0, 10, 0, 0, 0, 10, 0]),
      );
      final o = FieldSample();
      field.sample(5, 5, 0, 0, o);
      expect(o.dx, closeTo(5, 1e-5));
      field.sample(20, 5, 0, 0, o);
      expect(o.dx, 0);
      field.sample(10, 10, 0, 0, o);
      expect(o.dx, closeTo(10, 1e-5));
    });

    test('fromFunction matches function at nodes', () {
      final field = GridVectorField.fromFunction(
        bounds: const FieldBounds(-10, -10, 20, 20),
        columns: 3,
        rows: 3,
        fn: (x, y, t, o) {
          o.dx = x;
          o.dy = y;
        },
      );
      final o = FieldSample();
      field.sample(10, -10, 0, 0, o);
      expect(o.dx, closeTo(10, 1e-5));
      expect(o.dy, closeTo(-10, 1e-5));
    });

    test('flow map decodes red/green around 128', () {
      final rgba = Uint8List.fromList([
        255, 0, 0, 255, 0, 255, 0, 255, //
        128, 128, 0, 255, 128, 128, 0, 255,
      ]);
      final field = GridVectorField.fromFlowMap(
        rgba: rgba,
        width: 2,
        height: 2,
        bounds: const FieldBounds(0, 0, 1, 1),
      );
      final o = FieldSample();
      field.sample(0, 0, 0, 0, o);
      expect(o.dx, closeTo(1, 1e-5));
      expect(o.dy, closeTo(-1, 1e-5));
    });

    test('heightmap gradient points downhill', () {
      // Brightness increases left to right.
      final px = <int>[];
      for (var y = 0; y < 3; y++) {
        for (var x = 0; x < 3; x++) {
          px.addAll([x * 100, x * 100, x * 100, 255]);
        }
      }
      final field = GridVectorField.fromHeightmap(
        rgba: Uint8List.fromList(px),
        width: 3,
        height: 3,
        bounds: const FieldBounds(0, 0, 2, 2),
        mode: HeightmapMode.gradient,
      );
      final o = FieldSample();
      field.sample(1, 1, 0, 0, o);
      expect(o.dx, lessThan(0));
      expect(o.dy, closeTo(0, 1e-6));
    });

    test('vector field force applies in both modes', () {
      final f = FunctionVectorField.planar(_constX);
      final acc = _system()..forces.add(VectorFieldForce(f, strength: 2));
      acc.spawn(life: 10);
      acc.step(0.05);
      expect(acc.buffers.vx[0], closeTo(0.05 * 10 * 2, 1e-4));

      final vel = _system()
        ..forces.add(
          VectorFieldForce(f, mode: VectorFieldMode.velocity, response: 1000),
        );
      vel.spawn(life: 10);
      vel.step(0.05);
      expect(vel.buffers.vx[0], closeTo(10, 1e-4));
    });
  });

  group('Behaviors', () {
    test('fade, scale and color follow life', () {
      final s = _system()
        ..behaviors.addAll(const [FadeOut(), ScaleOverLife(start: 2, end: 0)]);
      s.spawn(life: 1, color: 0xFF112233);
      s.step(0.05);
      s.step(0.05);
      s.step(0.05);
      s.step(0.05);
      s.step(0.05);
      // t == 0.2 when behaviors ran on the last step (age 0.2 before integration).
      final a = s.buffers.color[0] >> 24;
      expect(a, closeTo(0.8 * 255, 3));
      expect(s.buffers.color[0] & 0xFFFFFF, 0x112233);
      expect(s.buffers.size[0], closeTo(1.6, 0.1));
    });

    test('color over life interpolates', () {
      final s = _system()
        ..behaviors.add(
          const ColorOverLife(begin: 0xFF000000, end: 0xFFFFFFFF),
        );
      s.spawn(life: 0.2);
      s.step(0.05);
      s.step(0.05);
      expect(s.buffers.color[0] & 0xFF, closeTo(0.25 * 255, 2));
    });

    test('bounds kill removes particles outside', () {
      final s = _system()..behaviors.add(const BoundsKill(-10, -10, 10, 10));
      s.spawn(x: 100, life: 10);
      s.spawn(x: 0, life: 10);
      s.step(0.01);
      expect(s.count, 1);
      expect(s.buffers.px[0], 0);
    });

    test('custom behavior runs per particle with mask', () {
      final s = _system(max: 4)
        ..behaviors.add(
          CustomBehavior((b, i, dt, t) => b.rotation[i] = 3, kindMask: 1 << 2),
        );
      s.spawn(life: 10, kind: 2);
      s.spawn(life: 10, kind: 0);
      s.step(0.01);
      expect(s.buffers.rotation[0], 3);
      expect(s.buffers.rotation[1], 0);
    });
  });
}

void _constX(double x, double y, double t, FieldSample o) {
  o.dx = 10;
  o.dy = 0;
}
