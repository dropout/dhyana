import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class InputGap extends StatelessWidget {

  final bool isEndGap;

  const InputGap({
    this.isEndGap = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: double.infinity,
      child: CustomPaint(
        painter: GapIconPainter(
          isEndGap: isEndGap,
        ),
      )
    );
  }

}

class GapIconPainter extends CustomPainter {

  final bool isEndGap;
  final double padding;
  final double preferredSize;

  GapIconPainter({
    this.isEndGap = false,
    this.padding = 3,
    this.preferredSize = 16,
  });

  final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {

    // final Offset topCenter = Offset(size.width/2, padding);
    // final Offset bottomCenter = Offset(size.width/2, size.height - padding);

    // if the height is less than the preferred size, do not draw
    if (size.height < preferredSize) {
      return;
    }

    double topStart = (size.height - preferredSize) / 2;
    final Offset topCenter = Offset(size.width / 2, topStart);
    final Offset bottomCenter = Offset(topCenter.dx, topCenter.dy + preferredSize);

    // vertical line
    canvas.drawLine(topCenter, bottomCenter, _paint);

    // arrow head
    canvas.drawLine(
      bottomCenter + Offset(-4, -4),
      bottomCenter,
      _paint,
    );

    canvas.drawLine(
      bottomCenter + Offset(4, -4),
      bottomCenter,
      _paint,
    );

    if (isEndGap) {
      canvas.drawLine(
        bottomCenter + Offset(-6, 4),
        bottomCenter + Offset(6, 4),
        _paint
      );
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
