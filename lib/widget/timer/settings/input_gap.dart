import 'package:flutter/material.dart';

class InputGap extends StatelessWidget {

  final bool isEndGap;

  const InputGap({
    this.isEndGap = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          // vertical: AppThemeData.paddingMd,
          horizontal: 0,
        ),
        child: SizedBox(
            width: 21,
            height: 21,
            child: CustomPaint(
              painter: GapIconPainter(
                isEndGap: isEndGap,
              ),
            )
        )
    );
  }

}

class GapIconPainter extends CustomPainter {

  final bool isEndGap;
  final double padding = 3;

  GapIconPainter({
    this.isEndGap = false,
  });

  final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {

    final Offset topCenter = Offset(size.width/2, padding);
    final Offset bottomCenter = Offset(size.width/2, size.height - padding);

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
