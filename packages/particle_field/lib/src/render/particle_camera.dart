// ignore_for_file: prefer_initializing_formals
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

/// Result of [ParticleCamera.project], reused to avoid allocation.
class ProjectedPoint {
  /// Screen position relative to the particle-space origin, in logical px.
  double x = 0, y = 0;

  /// Distance along the view direction; larger is farther away.
  double depth = 0;

  /// Screen pixels per world unit at this point.
  double scale = 1;
}

/// A world-space ray, as returned by [ParticleCamera.rayAt].
class PickRay {
  PickRay(this.ox, this.oy, this.oz, this.dx, this.dy, this.dz);
  final double ox, oy, oz, dx, dy, dz;

  /// Intersection with the plane `z = [z]`, or null when parallel or behind.
  ({double x, double y})? intersectPlaneZ(double z) {
    if (dz.abs() < 1e-9) return null;
    final t = (z - oz) / dz;
    if (t < 0) return null;
    return (x: ox + dx * t, y: oy + dy * t);
  }
}

/// Orbit camera shared between 3D renderers.
///
/// World space is right-handed with +y down, so +z points away from the
/// default viewer. With `yaw = pitch = 0` the camera sits at
/// `(0, 0, -distance)` looking at [target] and an orthographic view matches
/// the 2D look of the other renderers. Mutating any property notifies
/// listeners, which makes renderers repaint.
class ParticleCamera extends ChangeNotifier {
  ParticleCamera({
    double distance = 600,
    double yaw = 0,
    double pitch = 0,
    double targetX = 0,
    double targetY = 0,
    double targetZ = 0,
    double fovY = pi / 3,
    bool orthographic = false,
    double orthoScale = 1,
    double near = 1,
    double far = 100000,
  }) : _distance = distance,
       _yaw = yaw,
       _pitch = pitch.clamp(-_maxPitch, _maxPitch).toDouble(),
       _tx = targetX,
       _ty = targetY,
       _tz = targetZ,
       _fovY = fovY,
       _orthographic = orthographic,
       _orthoScale = orthoScale,
       _near = near,
       _far = far {
    _update();
  }

  /// Orthographic camera looking down +z, equivalent to a 2D view.
  ParticleCamera.orthographic({double scale = 1})
    : this(orthographic: true, orthoScale: scale);

  static const double _maxPitch = pi / 2 - 0.01;

  double _distance, _yaw, _pitch, _tx, _ty, _tz, _fovY, _orthoScale;
  double _near, _far;
  bool _orthographic;

  // Cached basis vectors and eye position.
  double _fx = 0, _fy = 0, _fz = 1;
  double _rx = 1, _ry = 0, _rz = 0;
  double _ux = 0, _uy = -1, _uz = 0;
  double _px = 0, _py = 0, _pz = 0;
  double _focal = 1;

  double get distance => _distance;
  set distance(double v) => _set(() => _distance = max(1.0, v));

  /// Rotation around the vertical axis, in radians.
  double get yaw => _yaw;
  set yaw(double v) => _set(() => _yaw = v);

  /// Positive pitch moves the camera above the target.
  double get pitch => _pitch;
  set pitch(double v) =>
      _set(() => _pitch = v.clamp(-_maxPitch, _maxPitch).toDouble());

  /// Vertical field of view of the perspective projection, in radians.
  double get fovY => _fovY;
  set fovY(double v) => _set(() => _fovY = v.clamp(0.05, pi - 0.05).toDouble());

  bool get orthographic => _orthographic;
  set orthographic(bool v) => _set(() => _orthographic = v);

  /// Pixels per world unit in orthographic mode.
  double get orthoScale => _orthoScale;
  set orthoScale(double v) => _set(() => _orthoScale = max(1e-4, v));

  double get near => _near;
  set near(double v) => _set(() => _near = max(1e-3, v));
  double get far => _far;
  set far(double v) => _set(() => _far = v);

  double get targetX => _tx;
  double get targetY => _ty;
  double get targetZ => _tz;

  /// Eye position in world space.
  ({double x, double y, double z}) get position => (x: _px, y: _py, z: _pz);

  void setTarget(double x, double y, double z) => _set(() {
    _tx = x;
    _ty = y;
    _tz = z;
  });

  /// Rotates around the target; pitch is clamped to avoid flipping.
  void orbit(double deltaYaw, double deltaPitch) => _set(() {
    _yaw += deltaYaw;
    _pitch = (_pitch + deltaPitch).clamp(-_maxPitch, _maxPitch).toDouble();
  });

  /// Multiplies the distance (perspective) and zoom (orthographic).
  void dolly(double factor) => _set(() {
    _distance = max(1.0, _distance * factor);
    _orthoScale = max(1e-4, _orthoScale / factor);
  });

  /// Slides the target along the screen plane by world units.
  void pan(double right, double up) => _set(() {
    _tx += _rx * right + _ux * up;
    _ty += _ry * right + _uy * up;
    _tz += _rz * right + _uz * up;
  });

  void _set(VoidCallback change) {
    change();
    _update();
    notifyListeners();
  }

  void _update() {
    final cp = cos(_pitch);
    _fx = sin(_yaw) * cp;
    _fy = sin(_pitch);
    _fz = cos(_yaw) * cp;
    // right = forward × up with up = (0, -1, 0); stays horizontal.
    final rl = sqrt(_fz * _fz + _fx * _fx);
    _rx = _fz / rl;
    _ry = 0;
    _rz = -_fx / rl;
    _ux = _ry * _fz - _rz * _fy;
    _uy = _rz * _fx - _rx * _fz;
    _uz = _rx * _fy - _ry * _fx;
    _px = _tx - _fx * _distance;
    _py = _ty - _fy * _distance;
    _pz = _tz - _fz * _distance;
  }

  /// Prepares the projection for a viewport of [size]; call once per frame
  /// before [project].
  void beginFrame(Size size) {
    _focal = (size.height / 2) / tan(_fovY / 2);
  }

  /// Projects a world point; returns false when it is outside near/far.
  bool project(double x, double y, double z, ProjectedPoint out) {
    final dx = x - _px, dy = y - _py, dz = z - _pz;
    final zc = dx * _fx + dy * _fy + dz * _fz;
    if (zc < _near || zc > _far) return false;
    final xc = dx * _rx + dy * _ry + dz * _rz;
    final yc = dx * _ux + dy * _uy + dz * _uz;
    final s = _orthographic ? _orthoScale : _focal / zc;
    out.x = xc * s;
    out.y = -yc * s;
    out.depth = zc;
    out.scale = s;
    return true;
  }

  /// Writes six `vec4`s for GPU renderers: eye, right, up, forward,
  /// `(focal, orthoScale or 0, near, far)` and
  /// `(halfWidth, halfHeight, originOffsetX, originOffsetY)`, where the offset is
  /// the particle-space origin relative to the viewport centre.
  void writeViewData(Float32List out, Size size, Offset originOffset) {
    beginFrame(size);
    out.setAll(0, [
      _px, _py, _pz, 0, //
      _rx, _ry, _rz, 0,
      _ux, _uy, _uz, 0,
      _fx, _fy, _fz, 0,
      _focal, _orthographic ? _orthoScale : 0, _near, _far,
      size.width / 2, size.height / 2, originOffset.dx, originOffset.dy,
    ]);
  }

  /// World-space ray through the screen point ([sx], [sy]), measured relative
  /// to the particle-space origin. Call [beginFrame] first.
  PickRay rayAt(double sx, double sy) {
    if (_orthographic) {
      final a = sx / _orthoScale, b = -sy / _orthoScale;
      return PickRay(
        _px + _rx * a + _ux * b,
        _py + _ry * a + _uy * b,
        _pz + _rz * a + _uz * b,
        _fx,
        _fy,
        _fz,
      );
    }
    final dx = _fx * _focal + _rx * sx - _ux * sy;
    final dy = _fy * _focal + _ry * sx - _uy * sy;
    final dz = _fz * _focal + _rz * sx - _uz * sy;
    final l = sqrt(dx * dx + dy * dy + dz * dz);
    return PickRay(_px, _py, _pz, dx / l, dy / l, dz / l);
  }
}
