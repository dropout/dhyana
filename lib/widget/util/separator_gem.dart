import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';

class SeparatorGem extends StatelessWidget {

  final int count;
  final Color color;
  final double gemSize;
  final EdgeInsets padding;

  const SeparatorGem({
    required this.count,
    this.color = Colors.black,
    this.gemSize = 16,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: intersperseWidgets(
          SizedBox(width: gemSize),
          List.generate(count, (index) => buildGem(context))
        ).toList(),
      ),
    );
  }

  Widget buildGem(BuildContext context) {
    return CustomPaint(
      size: Size.square(gemSize),
      painter: GemPainter(color: color),
    );
  }
}

class GemPainter extends CustomPainter {

  final Color color;

  const GemPainter({
    required this.color
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color;
    var path = Path();
    path.moveTo(size.width*0.5, 0);
    path.lineTo(size.width, size.height*0.5);
    path.lineTo(size.width*0.5, size.height);
    path.lineTo(0, size.height*0.5);
    path.moveTo(size.width*0.5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
