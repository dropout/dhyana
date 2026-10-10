import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:particle_field/particle_field.dart';

void main() {
  testWidgets('soft circle image is generated', (tester) async {
    final image = await tester.runAsync(
      () => createSoftCircleImage(diameter: 32),
    );
    expect(image!.width, 32);
    expect(image.height, 32);
  });

  testWidgets('atlas renderer transforms and frames', (tester) async {
    final image = (await tester.runAsync(
      () => createSoftCircleImage(diameter: 32),
    ))!;
    final frames = spriteSheetFrames(image, columns: 2, rows: 1);
    expect(frames[1], const ui.Rect.fromLTWH(16, 0, 16, 32));

    final r = AtlasRenderer(
      image: image,
      frames: frames,
      spriteSize: 32,
      frameSelector: (b, i) => b.kind[i],
    );
    final b = ParticleBuffers(4);
    b.add(x: 100, y: 50, size: 2, kind: 0);
    b.add(x: 0, y: 0, rotation: pi / 2, kind: 1);
    final out = r.fill(b, 2);

    // Frame 0 is 16 wide, scale = 2 * 32 / 16 = 4; centre lands on the particle.
    expect(out.transforms[0], closeTo(4, 1e-5));
    expect(out.transforms[2], closeTo(100 - 4 * 8, 1e-4));
    expect(out.transforms[3], closeTo(50 - 4 * 16, 1e-4));
    expect(out.rects.sublist(0, 4), [0, 0, 16, 32]);
    expect(out.rects.sublist(4, 8), [16, 0, 32, 32]);
    // Rotated 90deg: scos ~ 0, ssin = scale (2).
    expect(out.transforms[4], closeTo(0, 1e-5));
    expect(out.transforms[5], closeTo(2, 1e-5));
  });

  testWidgets('renderers paint without errors', (tester) async {
    final image = (await tester.runAsync(() => createSoftCircleImage()))!;
    final b = ParticleBuffers(8)
      ..add(x: 1, y: 2)
      ..add(x: 3, y: 4, color: 0x80FF0000);
    final renderers = <ParticleRenderer>[
      AtlasRenderer(image: image, blendMode: ui.BlendMode.plus),
      PointsRenderer(),
      PerParticleRenderer(
        (c, b, i) => c.drawCircle(ui.Offset(b.px[i], b.py[i]), 2, ui.Paint()),
      ),
      CallbackRenderer((c, s, b) {}),
    ];
    for (final r in renderers) {
      final rec = ui.PictureRecorder();
      r.paint(ui.Canvas(rec), const ui.Size(100, 100), b);
      rec.endRecording().dispose();
    }
  });
}
