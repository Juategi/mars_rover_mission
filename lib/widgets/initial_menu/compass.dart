import 'package:flutter/material.dart';
import 'dart:math' as math;

class Compass extends StatelessWidget {
  const Compass({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 70,
            child: CustomPaint(
              size: const Size(20, 20),
              painter: DiamondPainter(),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: CustomPaint(
                size: const Size(20, 20),
                painter: DiamondPainter(),
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 55,
            child: CustomPaint(
              size: const Size(50, 50),
              painter: CirclePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  final Paint _paint = Paint();

  DiamondPainter() {
    _paint.color = Colors.white;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height * 4);
    path.lineTo(size.width / 2, size.height * 8);
    path.lineTo(0, size.height * 4);
    path.close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePainter extends CustomPainter {
  final Paint _paint = Paint();

  CirclePainter() {
    _paint.color = Colors.white;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
