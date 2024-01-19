import 'package:flutter/material.dart';

class ObstacleTile extends StatelessWidget {
  const ObstacleTile({super.key});

  final String obstacleImagePath = 'assets/images/obstacle.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      obstacleImagePath,
    );
  }
}
