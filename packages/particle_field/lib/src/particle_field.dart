
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ParticleField extends StatefulWidget {

  final ParticleController controller;

  const ParticleField({
    required this.controller,
    super.key
  });

  @override
  State<ParticleField> createState() => _ParticleFieldState();
}

class _ParticleFieldState extends State<ParticleField> {

  late final ParticlePainter particlePainter;

  @override
  void initState() {
    particlePainter = ParticlePainter(
      controller: widget.controller,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: particlePainter,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}

class ParticleController with ChangeNotifier {

  ParticleInit? onInit;
  ParticleTick onTick;
  TickerProvider vsync;
  late Ticker _ticker;
  List<Particle> particles = [];

  Duration _lastElapsedTime = Duration.zero;

  ParticleController({
    required this.vsync,
    required this.onTick,
    bool autoStart = true,
    this.onInit,
  }) {
    onInit?.call(this);
    _ticker = vsync.createTicker(tick);
    if (autoStart) start();
  }

  void tick(Duration elapsedTime) {
    onTick(this, _lastElapsedTime);

    if (particles.isNotEmpty) notifyListeners();
    _lastElapsedTime = elapsedTime;
  }

  void start() {
    if (_ticker.isActive) return;
    _lastElapsedTime = Duration.zero;
    _ticker.start();
  }

  void stop() {
    _ticker.stop();
  }

  @override
  dispose() {
    _ticker.dispose();
    super.dispose();
  }

}

class Particle {

  double x;
  double y;
  double vx;
  double vy;
  double lifespan;
  double age;
  Color color;

  Particle({
    this.x = 0.0,
    this.y = 0.0,
    this.vx = 0.0,
    this.vy = 0.0,
    this.lifespan = 0.0,
    this.age = 0.0,
    this.color = Colors.green,
  });

  void update({
    double? x,
    double? y,
    double? vx,
    double? vy,
    double? lifespan,
    double? age,
  }) {
    if (x != null) this.x = x;
    if (y != null) this.y = y;
    if (vx != null) this.vx = vx;
    if (vy != null) this.vy = vy;
    if (lifespan != null) this.lifespan = lifespan;
    this.age = age ?? this.age + 1;

    if (x == null) this.x += this.vx;
    if (y == null) this.y += this.vy;
  }

  Offset toOffset([Matrix4? transform]) {
    Offset o = Offset(x, y);
    if (transform == null) return o;
    return MatrixUtils.transformPoint(transform, o);
  }

}

class ParticlePainter extends CustomPainter {

  final ParticleController controller;

  ParticlePainter({
    required this.controller,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    // 0,0 is the center of the canvas in particle space
    canvas.translate(size.width/2, size.height/2);

    for (Particle p in controller.particles) {
      double sizeRatio = 1 - (p.age / p.lifespan);
      canvas.drawCircle(
        p.toOffset(),
        6.0 * sizeRatio,
        Paint()..color = p.color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

typedef ParticleTick =
void Function(ParticleController controller, Duration elapsed);

typedef ParticleInit =
void Function(ParticleController controller);
