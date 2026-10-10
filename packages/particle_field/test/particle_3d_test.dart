import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:particle_field/particle_field.dart';

ParticleSystem _system() =>
    ParticleSystem(maxParticles: 256, random: Random(1));

void main() {
  test('z velocity integrates and survives swap-remove', () {
    final s = _system();
    s.spawn(z: 1, vz: 10, life: 0.02);
    s.spawn(z: 5, vz: 20, life: 10);
    s.step(0.05);
    expect(s.count, 1);
    expect(s.buffers.pz[0], closeTo(5 + 20 * 0.05, 1e-6));
    expect(s.buffers.vz[0], 20);
  });

  test('3D forces act on z', () {
    final s = _system()
      ..forces.add(const Gravity(x: 0, y: 0, z: 100))
      ..forces.add(
        const Attractor(x: 0, y: 0, z: 0, strength: 100, radius: 50),
      );
    s.spawn(z: 10, life: 10);
    s.step(0.05);
    expect(s.buffers.vz[0], isNot(0));
    expect(s.buffers.vx[0], 0);
  });

  test('vortex around x axis pushes in the yz plane', () {
    final s = _system()
      ..forces.add(const Vortex(axisX: 1, axisZ: 0, radius: 100));
    s.spawn(y: 10, life: 10);
    s.step(0.05);
    expect(s.buffers.vz[0], isNot(0));
    expect(s.buffers.vx[0].abs(), lessThan(1e-9));
  });

  test('sphere shape surface and box stay in range', () {
    final r = Random(3);
    final o = Vec3();
    for (var i = 0; i < 200; i++) {
      const SphereShape(10, surfaceOnly: true).sample(r, o);
      expect(sqrt(o.x * o.x + o.y * o.y + o.z * o.z), closeTo(10, 1e-9));
      const BoxShape(2, 4, 6).sample(r, o);
      expect(o.z.abs(), lessThanOrEqualTo(3));
    }
  });

  test('cone axis keeps directions within the half angle', () {
    final s = _system();
    final t = ParticleTemplate(
      axis: (0, 0, 1),
      spread: pi / 3,
      minSpeed: 100,
      maxSpeed: 100,
    );
    for (var i = 0; i < 100; i++) {
      final k = t.spawnAt(s, 0, 0);
      final b = s.buffers;
      expect(b.vz[k] / 100, greaterThanOrEqualTo(cos(pi / 6) - 1e-6));
      final m = sqrt(b.vx[k] * b.vx[k] + b.vy[k] * b.vy[k] + b.vz[k] * b.vz[k]);
      expect(m, closeTo(100, 1e-4));
    }
  });

  test('radial 3D emits away from the origin', () {
    final s = _system();
    final t = ParticleTemplate(
      shape: const SphereShape(20, surfaceOnly: true),
      radial: true,
      minSpeed: 10,
      maxSpeed: 10,
    );
    final k = t.spawnAt(s, 0, 0);
    final b = s.buffers;
    expect(
      b.vx[k] * b.px[k] + b.vy[k] * b.py[k] + b.vz[k] * b.pz[k],
      greaterThan(0),
    );
  });

  test('volume field interpolates trilinearly and is zero outside', () {
    final f = VolumeVectorField.fromFunction(
      bounds: const VolumeBounds.centered(10, 10, 10),
      columns: 3,
      rows: 3,
      layers: 3,
      fn: (x, y, z, t, o) {
        o.dx = x;
        o.dz = z * 2;
      },
    );
    final o = FieldSample();
    f.sample(2, 0, 3, 0, o);
    expect(o.dx, closeTo(2, 1e-5));
    expect(o.dz, closeTo(6, 1e-5));
    f.sample(0, 0, 9, 0, o);
    expect(o.dx, 0);
  });

  test('curl noise is deterministic, finite and respects planar', () {
    const f = CurlNoiseField(frequency: 0.05, seed: 2);
    final a = FieldSample(), b = FieldSample();
    f.sample(10, 20, 30, 1, a);
    f.sample(10, 20, 30, 1, b);
    expect(a.dx, b.dx);
    expect(a.dx.isFinite && a.dy.isFinite && a.dz.isFinite, isTrue);
    expect(a.dx.abs() + a.dy.abs() + a.dz.abs(), greaterThan(0));
    const p = CurlNoiseField(frequency: 0.05, planar: true);
    p.sample(10, 20, 30, 1, a);
    expect(a.dz, 0);
  });

  test('BoundsKill respects z range', () {
    final s = _system()
      ..behaviors.add(const BoundsKill(-10, -10, 10, 10, minZ: -5, maxZ: 5));
    s.spawn(z: 6, life: 10);
    s.spawn(z: 0, life: 10);
    s.step(0.01);
    expect(s.count, 1);
  });
}
