import 'package:flutter/material.dart';

class SmoothGraph extends StatelessWidget {
  final Color color;

  SmoothGraph({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Graph(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 196, 255, 0.2),
        ),
      ),
    );
  }
}

class Graph extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double dx = size.width / size.width * 1;
    double dy = size.height / size.height * .9;
    var path = Path()
      ..moveTo(0 * dx, 179.95 * dy)
      ..lineTo(0 * dx, 21.11 * dy)
      ..cubicTo(
        0,
        21.11 * dy,
        16.15 * dx,
        20.34 * dy,
        28.46 * dx,
        36.11 * dy,
      )
      ..cubicTo(
        40.77 * dx,
        51.88 * dy,
        50.04 * dx,
        55.4 * dy,
        55.3 * dx,
        55 * dy,
      )
      ..cubicTo(
        60.56 * dx,
        54.6 * dy,
        70.68 * dx,
        41.61 * dy,
        70.68 * dx,
        41.61 * dy,
      )
      ..cubicTo(
        70.68 * dx,
        41.61 * dy,
        78.09 * dx,
        30.14 * dy,
        85.1 * dx,
        29.5 * dy,
      )
      ..cubicTo(
        92.11 * dx,
        28.86 * dy,
        100.08 * dx,
        29.5 * dy,
        100.08 * dx,
        29.5 * dy,
      )
      ..cubicTo(
        100.08 * dx,
        29.5 * dy,
        109.4 * dx,
        30 * dy,
        118.49 * dx,
        21.11 * dy,
      )
      ..cubicTo(
        127.57 * dx,
        12.21 * dy,
        131.08 * dx,
        8.15 * dy,
        140.24 * dx,
        10.3 * dy,
      )
      ..cubicTo(
        149.41 * dx,
        12.45 * dy,
        167.49 * dx,
        19.46 * dy,
        178.97 * dx,
        15.32 * dy,
      )
      ..cubicTo(
        190.44 * dx,
        11.17 * dy,
        202.32 * dx,
        6.87 * dy,
        213.71 * dx,
        15.32 * dy,
      )
      ..cubicTo(
        225.1 * dx,
        23.76 * dy,
        242 * dx,
        39.7 * dy,
        259.69 * dx,
        40.1 * dy,
      )
      ..cubicTo(
        277.38 * dx,
        40.5 * dy,
        298.81 * dx,
        51.17 * dy,
        311.56 * dx,
        46.63 * dy,
      )
      ..cubicTo(
        324.31 * dx,
        42.09 * dy,
        334.27 * dx,
        28.31 * dy,
        334.27 * dx,
        28.31 * dy,
      )
      ..cubicTo(
        334.27 * dx,
        28.31 * dy,
        345.67 * dx,
        7.27 * dy,
        364.87 * dx,
        22.17 * dy,
      )
      ..cubicTo(
        370.38 * dx,
        26.45 * dy,
        384.08 * dx,
        39.58 * dy,
        390.63 * dx,
        37.76 * dy,
      )
      ..cubicTo(
        403.85 * dx,
        34.08 * dy,
        411.32 * dx,
        8.43 * dy,
        413.45 * dx,
        1.36 * dy,
      )
      ..cubicTo(413.45 * dx, 1.36 * dy, 413.87 * dx, 0, 413.92 * dx, 0)
      ..lineTo(
        414.11 * dx,
        179.95 * dy,
      )
      ..lineTo(0, 179.95 * dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
