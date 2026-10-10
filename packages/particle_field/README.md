# particle_field

A reusable 2D particle system for Flutter. The simulation runs on typed arrays
(structure of arrays) and renders in batches (`drawRawAtlas`, `drawRawPoints`) or
through your own painter.

- Emitters: continuous (`RateEmitter`) and burst (`BurstEmitter`), with point, circle, rect and line spawn shapes.
- Forces: gravity, wind, drag, attractor, vortex, vector fields, custom.
- Vector fields from a function, a sampled grid, a flow-map image or a heightmap image.
- Behaviours: fade, scale and colour over life, bounds kill, custom.
- Renderers: sprite atlas, points, or fully custom painting.
- Presets: `Fireworks` and `ShrinkingBurst`.

## Quick start

```dart
class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  late final ParticleController controller;
  AtlasRenderer? renderer;

  @override
  void initState() {
    super.initState();
    controller = ParticleController(
      vsync: this,
      system: ParticleSystem(
        maxParticles: 2000,
        emitters: [
          RateEmitter(
            rate: 200,
            template: const ParticleTemplate(
              direction: -pi / 2,
              spread: 0.5,
              minSpeed: 60,
              maxSpeed: 120,
              minLife: 1,
              maxLife: 2,
              color: 0xFFFFB74D,
            ),
          ),
        ],
        forces: const [Gravity(y: 80), Drag(coefficient: 0.5)],
        behaviors: const [FadeOut(), ScaleOverLife(start: 1, end: 0.2)],
      ),
    );
    createSoftCircleImage().then((image) {
      if (mounted) setState(() => renderer = AtlasRenderer(image: image, spriteSize: 12));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      ParticleField(controller: controller, renderer: renderer);
}
```

See [example/particle_field_example.dart](example/particle_field_example.dart)
for fireworks, a flow field and the burst effect.

## Concepts

| Type | Role |
|---|---|
| `ParticleSystem` | Pure simulation. `step(dt)` runs emitters, forces, behaviours, integration, then removal. Seedable `Random`, `dt` clamped to `maxDt`. |
| `ParticleBuffers` | Typed-array storage (`px`, `py`, `pz`, `vx`, `vy`, `vz`, `age`, `life`, `size`, `rotation`, `color`, `kind`, optional `custom` channels). Live particles are `[0, count)`; removal is swap-remove. |
| `Emitter` | Spawns particles each step. `ParticleTemplate` describes what is spawned. |
| `ForceField` | Changes velocity for the whole particle range per call. |
| `ParticleBehavior` | Per-particle logic over the range (fade, scale, colour, custom). |
| `ParticleRenderer` | Paints the buffers. |
| `ParticleController` | Ticker that steps the system with the real frame `dt` and repaints. |
| `ParticleField` | Widget that paints a controller with a renderer. |

Units are logical pixels and seconds, +y points down. Every particle has a
z coordinate (0 in 2D); in 3D, +z points away from a default camera
(right-handed). See [3D](#3d). Particle space has its
origin at `ParticleField.alignment` (centre by default); use
`ParticleField.toParticleSpace` to convert tap positions.

## API overview

### System and controller

- `ParticleSystem({maxParticles, customChannels, random, maxDt, emitters, forces, behaviors, onDeath})`
  - `spawn(...)` returns the particle index, or -1 when the system is full.
  - `onDeath(system, index)` runs before removal and may call `spawn` (used for fireworks).
  - `time` is the simulated time in seconds.
- `ParticleController({vsync, system, onFrame, autoStart})`: `start`, `stop`, `emitAt`, `clear`. The first frame after a start uses `dt = 0`.
- `ParticleField({controller, renderer, alignment, clip, child})`: defaults to a `PointsRenderer`.

### Emitters

- `RateEmitter(template, rate, x, y, z)`: fractional rates are accumulated, so low rates stay accurate.
- `BurstEmitter(template, count, interval, repeat, x, y, z)`: `repeat: null` repeats forever; `fire(system, [x, y, z])` triggers manually.
- `ParticleTemplate`: shape, direction and spread, `radial` emission, a 3D `axis` cone, speed, life and size ranges, colour or `colorPicker`, `kind`, `onSpawn`.
- Shapes: `PointShape`, `CircleShape`, `RectShape`, `LineShape`, `SphereShape`, `BoxShape`; implement `EmitterShape` for your own.

### Forces

All forces take an optional `kindMask`, where bit `1 << kind` selects the particle kinds affected.

| Force | Effect |
|---|---|
| `Gravity` | Constant acceleration |
| `Wind` | Eases velocity toward a target velocity |
| `Drag` | Exponential damping, frame-rate independent |
| `Attractor` | Pulls (or pushes, with negative strength) toward a point within a radius |
| `Vortex` | Swirl around an axis through a point (default axis is z) |
| `VectorFieldForce` | Samples a `VectorField`; as acceleration or as a target velocity |
| `CustomForce` | Your own function over the whole range |

### Vector fields

| Source | API |
|---|---|
| Function | `FunctionVectorField(fn)` with `(x, y, z, t, out)`, or `FunctionVectorField.planar` for `(x, y, t, out)` |
| 3D volume | `VolumeVectorField` (trilinear) or `VolumeVectorField.fromFunction` |
| Curl noise | `CurlNoiseField(frequency:, amplitude:, planar:)`: divergence-free swirling flow |
| Sampled grid | `GridVectorField(bounds, columns, rows, data)` or `GridVectorField.fromFunction` |
| Flow-map image | `GridVectorField.fromFlowMap` (red/green = dx/dy, 128 is zero) |
| Heightmap image | `GridVectorField.fromHeightmap` (`gradient` or `curl`) |
| `ui.Image` | `gridVectorFieldFromImage(image, bounds:, heightmap:)` |

Grids are sampled bilinearly (volumes trilinearly) and are zero outside their
bounds. Image-based grids are 2D and ignore z.

### Behaviours

`FadeOut`, `ScaleOverLife`, `ColorOverLife`, `BoundsKill` (with `minZ`/`maxZ`), and
`CustomBehavior((buffers, i, dt, time) {...})`. `FadeOut` and `ColorOverLife`
both write alpha, so the last one in the list wins.

### Rendering

| Renderer | Use |
|---|---|
| `AtlasRenderer` | One `drawRawAtlas` call. Per-particle size, rotation and tint, sprite sheets via `frames` and `frameSelector`, `blendMode: BlendMode.plus` for glow. |
| `PointsRenderer` | Cheapest: one colour and size for all particles. |
| `PerParticleRenderer` | Custom painting called per particle index. Simple but slower. |
| `CallbackRenderer` | Custom painting with the whole buffers. |
| `AtlasRenderer3D` | CPU 3D: projects through a `ParticleCamera`, culls, depth sorts and draws with `drawRawAtlas`. |
| `GpuParticleRenderer` | Flutter GPU 3D: instanced billboards in one draw call (`particle_field_gpu.dart`). |

Sprite helpers: `createSoftCircleImage`, `loadAtlasImage(assetPath)`, `spriteSheetFrames(image, columns:, rows:)`.

To add another backend, implement `ParticleRenderer` and read the buffers
directly. Override `repaint` to repaint when something other than the system
changes (a camera, for instance).

### Presets

- `Fireworks`: `launch(x, y, z:, apexY:, color:)` fires a rocket (`spherical: true` bursts into a 3D sphere) that bursts into sparks at its apex. Use `.system` with a `ParticleController`.
- `ShrinkingBurst`: shrinking, slowing dots; `emit(count:)`, `.renderer`.

## Writing custom logic

Behaviours and forces receive the buffers and work on indices:

```dart
const CustomBehavior(_flicker, kindMask: 1 << 1);

void _flicker(ParticleBuffers b, int i, double dt, double time) {
  b.size[i] = 0.8 + 0.2 * sin(time * 20 + i);
}
```

Use `customChannels` on the system for extra per-particle state, available as
`buffers.custom[k][i]`.

## 3D

The simulation is always 3D; 2D is simply z = 0 with an orthographic view.
Add z to spawns (`spawn(z:, vz:)`, `ParticleTemplate.axis`, `SphereShape`,
`BoxShape`), forces and fields, then pick a 3D renderer.

```dart
final camera = ParticleCamera(distance: 700, pitch: 0.3);

ParticleField(
  controller: controller,
  renderer: AtlasRenderer3D(image: sprite, camera: camera, sort: false,
      blendMode: BlendMode.plus),
);

// Wire your own gestures; renderers repaint when the camera changes.
camera.orbit(dx * 0.01, dy * 0.01);
camera.dolly(0.9);
```

`ParticleCamera` is an orbit camera (`orbit`, `dolly`, `pan`, `distance`,
`fovY`, `orthographic`). `project` maps a world point to the screen and
`rayAt(sx, sy)` returns a `PickRay` for picking, with `intersectPlaneZ`.
The camera's principal point is the `ParticleField.alignment` origin.

### Choosing a renderer

| | `AtlasRenderer3D` (CPU) | `GpuParticleRenderer` (Flutter GPU) |
|---|---|---|
| Availability | Everywhere | Experimental; needs Impeller and `--enable-flutter-gpu` |
| Particle count | Thousands | Tens of thousands and up |
| Depth sorting | Yes (counting sort) | No; use additive blending |
| Import | `particle_field.dart` | `particle_field_gpu.dart` |

```dart
final gpu = await GpuParticleRenderer.tryCreate(
  sprite: image,
  camera: camera,
  spriteSize: 12,
); // null when Flutter GPU is unavailable
final renderer = gpu ?? AtlasRenderer3D(image: image, camera: camera);
```

Flutter GPU is enabled with `flutter run --enable-flutter-gpu` (desktop), the
`FLTEnableFlutterGpu` Info.plist key (iOS) or the equivalent Android manifest
setting. The shaders are precompiled into `assets/particle.shaderbundle`; after
editing `shaders/` run `tool/build_shaders.sh`. The `alignment` passed to
`tryCreate` must match the `ParticleField`'s.

## Notes

- Spawning during a step is allowed from `onDeath` and `onSpawn`; spawned particles join the live range immediately and are not updated until the next step.
- Capacity is fixed by `maxParticles`; spawns beyond it are dropped.
