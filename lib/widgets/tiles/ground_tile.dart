import 'package:flutter/material.dart';

class GroundTile extends StatelessWidget {
  const GroundTile({super.key});
  final String groundImagePath = 'assets/images/ground.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      groundImagePath,
    );
  }
}
