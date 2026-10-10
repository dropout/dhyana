import 'dart:math';

import '../core/particle_buffers.dart';
import 'force_field.dart';
import 'vector_field.dart';

/// Constant acceleration in px/s².
class Gravity extends ForceField {
  const Gravity({this.x = 0, this.y = 300, this.z = 0, super.kindMask});
  final double x, y, z;

  @override
  void apply(ParticleBuffers b, int count, double dt, double time) {
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      b.vx[i] += x * dt;
      b.vy[i] += y * dt;
      b.vz[i] += z * dt;
    }
  }
}

/// Wind pushes toward a target velocity; [strength] is the response per second.
class Wind extends ForceField {
  const Wind({
    this.vx = 40,
    this.vy = 0,
    this.vz = 0,
    this.strength = 1,
    super.kindMask,
  });
  final double vx, vy, vz, strength;

  @override
  void apply(ParticleBuffers b, int count, double dt, double time) {
    final k = min(1.0, strength * dt);
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      b.vx[i] += (vx - b.vx[i]) * k;
      b.vy[i] += (vy - b.vy[i]) * k;
      b.vz[i] += (vz - b.vz[i]) * k;
    }
  }
}

/// Exponential velocity damping, framerate independent.
class Drag extends ForceField {
  const Drag({this.coefficient = 1, super.kindMask});
  final double coefficient;

  @override
  void apply(ParticleBuffers b, int count, double dt, double time) {
    final k = exp(-coefficient * dt);
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      b.vx[i] *= k;
      b.vy[i] *= k;
      b.vz[i] *= k;
    }
  }
}

/// Pulls (positive [strength]) or pushes (negative) particles toward a point.
class Attractor extends ForceField {
  const Attractor({
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.strength = 200,
    this.radius = 200,
    super.kindMask,
  });
  final double x, y, z, strength, radius;

  @override
  void apply(ParticleBuffers b, int count, double dt, double time) {
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      final dx = x - b.px[i], dy = y - b.py[i], dz = z - b.pz[i];
      final d = sqrt(dx * dx + dy * dy + dz * dz);
      if (d >= radius || d < 1e-3) continue;
      final f = strength * (1 - d / radius) * dt / d;
      b.vx[i] += dx * f;
      b.vy[i] += dy * f;
      b.vz[i] += dz * f;
    }
  }
}

/// Swirls particles around an axis through a point.
///
/// The default axis (0, 0, 1) is the screen normal, so positive [strength] is
/// clockwise on screen. The influence is a sphere of [radius].
class Vortex extends ForceField {
  const Vortex({
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.axisX = 0,
    this.axisY = 0,
    this.axisZ = 1,
    this.strength = 200,
    this.radius = 200,
    super.kindMask,
  });
  final double x, y, z, axisX, axisY, axisZ, strength, radius;

  @override
  void apply(ParticleBuffers b, int count, double dt, double time) {
    final al = sqrt(axisX * axisX + axisY * axisY + axisZ * axisZ);
    if (al == 0) return;
    final ax = axisX / al, ay = axisY / al, az = axisZ / al;
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      final dx = b.px[i] - x, dy = b.py[i] - y, dz = b.pz[i] - z;
      final d = sqrt(dx * dx + dy * dy + dz * dz);
      if (d >= radius || d < 1e-3) continue;
      final f = strength * (1 - d / radius) * dt / d;
      // axis × offset is tangential to the axis.
      b.vx[i] += (ay * dz - az * dy) * f;
      b.vy[i] += (az * dx - ax * dz) * f;
      b.vz[i] += (ax * dy - ay * dx) * f;
    }
  }
}

enum VectorFieldMode {
  /// Field value is an acceleration in px/s².
  acceleration,

  /// Velocity eases toward the field value (px/s) at [VectorFieldForce.response] per second.
  velocity,
}

/// Applies a [VectorField] sampled at each particle position.
class VectorFieldForce extends ForceField {
  VectorFieldForce(
    this.field, {
    this.strength = 1,
    this.mode = VectorFieldMode.acceleration,
    this.response = 2,
    super.kindMask,
  });

  final VectorField field;
  final double strength;
  final VectorFieldMode mode;
  final double response;
  final FieldSample _s = FieldSample();

  @override
  void apply(ParticleBuffers b, int count, double dt, double time) {
    final k = min(1.0, response * dt);
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      _s.dx = _s.dy = _s.dz = 0;
      field.sample(b.px[i], b.py[i], b.pz[i], time, _s);
      if (mode == VectorFieldMode.acceleration) {
        b.vx[i] += _s.dx * strength * dt;
        b.vy[i] += _s.dy * strength * dt;
        b.vz[i] += _s.dz * strength * dt;
      } else {
        b.vx[i] += (_s.dx * strength - b.vx[i]) * k;
        b.vy[i] += (_s.dy * strength - b.vy[i]) * k;
        b.vz[i] += (_s.dz * strength - b.vz[i]) * k;
      }
    }
  }
}

/// Escape hatch for fully custom forces.
class CustomForce extends ForceField {
  const CustomForce(this.fn, {super.kindMask});
  final void Function(ParticleBuffers b, int count, double dt, double time) fn;

  @override
  void apply(ParticleBuffers b, int count, double dt, double time) =>
      fn(b, count, dt, time);
}
