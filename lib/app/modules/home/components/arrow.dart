import 'dart:ui';

import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: Seti(),
      ),
    );
  }
}

class Seti extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = PointMode.polygon;
    final points = [
      Offset(0,0),
      Offset(size.width, size.height * 0.5),
      Offset(0, size.height),
    ];
    Paint paint = Paint()
      ..color = Color.fromRGBO(64, 196, 255, 0.2)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode,points,paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
