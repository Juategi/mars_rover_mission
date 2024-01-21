import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:mars_rover_mission/config/styles.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/initial_menu/initial_menu_controller.dart';

class DirectionSelector extends StatefulWidget {
  const DirectionSelector({Key? key}) : super(key: key);

  @override
  State<DirectionSelector> createState() => _DirectionSelectorState();
}

class _DirectionSelectorState extends State<DirectionSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: [
          Positioned(
            left: 97,
            top: 6,
            child: TextButton(
              onPressed: () {
                InitialMenuController.deployRover(context, Direction.north);
              },
              child: const Text(
                "N",
                style: Styles.textStyle,
              ),
            ),
          ),
          Positioned(
            top: 102,
            left: 190,
            child: TextButton(
              onPressed: () {
                InitialMenuController.deployRover(context, Direction.east);
              },
              child: const Text(
                "E",
                style: Styles.textStyle,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 97,
            child: TextButton(
              onPressed: () {
                InitialMenuController.deployRover(context, Direction.south);
              },
              child: const Text(
                "S",
                style: Styles.textStyle,
              ),
            ),
          ),
          Positioned(
            top: 102,
            left: 0,
            child: TextButton(
              onPressed: () {
                InitialMenuController.deployRover(context, Direction.west);
              },
              child: const Text(
                "W",
                style: Styles.textStyle,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 115,
            child: CustomPaint(
              size: const Size(20, 20),
              painter: DiamondPainter(),
            ),
          ),
          Positioned(
            top: 115,
            left: 45,
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: CustomPaint(
                size: const Size(20, 20),
                painter: DiamondPainter(),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 100,
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
