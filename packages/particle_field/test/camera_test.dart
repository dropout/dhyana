import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:particle_field/particle_field.dart';

const _size = Size(400, 300);

void main() {
  test('default orthographic camera matches 2D axes', () {
    final c = ParticleCamera.orthographic()..beginFrame(_size);
    final p = ProjectedPoint();
    expect(c.project(10, 20, 0, p), isTrue);
    expect(p.x, closeTo(10, 1e-9));
    expect(p.y, closeTo(20, 1e-9));
  });

  test('perspective shrinks far points and culls behind the camera', () {
    final c = ParticleCamera(distance: 500)..beginFrame(_size);
    final near = ProjectedPoint(), far = ProjectedPoint();
    c.project(50, 0, -100, near);
    c.project(50, 0, 300, far);
    expect(near.x, greaterThan(far.x));
    expect(near.depth, lessThan(far.depth));
    expect(c.project(0, 0, -600, near), isFalse);
  });

  test('orbit by 90 degrees maps +z to screen x', () {
    final c = ParticleCamera.orthographic()..orbit(pi / 2, 0);
    c.beginFrame(_size);
    final p = ProjectedPoint();
    c.project(0, 0, 100, p);
    expect(p.x.abs(), closeTo(100, 1e-6));
    expect(p.depth, closeTo(600, 1e-6));
  });

  test('pitch is clamped and positive pitch looks down', () {
    final c = ParticleCamera()..orbit(0, 10);
    expect(c.pitch, lessThan(pi / 2));
    expect(c.position.y, lessThan(0));
    c.beginFrame(_size);
    final p = ProjectedPoint();
    // A point above the target (negative y) still projects.
    expect(c.project(0, 0, 0, p), isTrue);
    expect(p.x.isFinite && p.y.isFinite, isTrue);
  });

  test('camera notifies on change', () {
    final c = ParticleCamera();
    var n = 0;
    c.addListener(() => n++);
    c.orbit(0.1, 0.1);
    c.dolly(0.5);
    c.distance = 300;
    expect(n, 3);
  });

  test('rays round-trip through projection', () {
    for (final ortho in [false, true]) {
      final c = ParticleCamera(orthographic: ortho)
        ..orbit(0.4, 0.3)
        ..beginFrame(_size);
      final p = ProjectedPoint();
      expect(c.project(30, -20, 40, p), isTrue);
      final ray = c.rayAt(p.x, p.y);
      final t =
          ((30 - ray.ox) * ray.dx +
          (-20 - ray.oy) * ray.dy +
          (40 - ray.oz) * ray.dz);
      expect(ray.ox + ray.dx * t, closeTo(30, 1e-6));
      expect(ray.oy + ray.dy * t, closeTo(-20, 1e-6));
      expect(ray.oz + ray.dz * t, closeTo(40, 1e-6));
      final hit = ray.intersectPlaneZ(40)!;
      expect(hit.x, closeTo(30, 1e-6));
      expect(hit.y, closeTo(-20, 1e-6));
    }
  });

  test('3D atlas renderer sorts back to front and culls', () async {
    final image = await createSoftCircleImage();
    final cam = ParticleCamera(distance: 500);
    final r = AtlasRenderer3D(image: image, camera: cam);
    final s = ParticleSystem(maxParticles: 16);
    s.spawn(z: 100, life: 10); // farthest
    s.spawn(z: -100, life: 10); // nearest
    s.spawn(z: 0, life: 10);
    s.spawn(z: -900, life: 10); // behind the camera
    final n = r.fill(s.buffers, _size);
    expect(n, 3);
    expect(r.drawOrder.sublist(0, 3), [0, 2, 1]);
  });

  test('view data packs basis, lens and viewport', () {
    final c = ParticleCamera(distance: 500);
    final data = Float32List(24);
    c.writeViewData(data, _size, const Offset(5, -7));
    expect(data[2], closeTo(-500, 1e-4)); // eye z
    expect(data[4], 1); // right.x
    expect(data[9], -1); // up.y
    expect(data[14], 1); // forward.z
    expect(data[18], c.near);
    expect(data[20], 200);
    expect(data[22], 5);
    expect(data[23], -7);
  });
}
