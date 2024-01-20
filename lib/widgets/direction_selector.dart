import 'package:flutter/material.dart';
import 'dart:math' as math;

class DirectionSelector extends StatefulWidget {
  const DirectionSelector({Key? key}) : super(key: key);

  @override
  State<DirectionSelector> createState() => _DirectionSelectorState();
}

class _DirectionSelectorState extends State<DirectionSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          Positioned(
            left: 70,
            child: CustomPaint(
              size: const Size(20, 20),
              painter: DiamondPainter(),
            ),
          ),
          Positioned(
            top: 70,
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: CustomPaint(
                size: const Size(20, 20),
                painter: DiamondPainter(),
              ),
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
