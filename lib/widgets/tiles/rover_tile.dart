import 'package:flutter/material.dart';
import 'package:mars_rover_mission/entities/rover.dart';

class RoverTile extends StatelessWidget {
  const RoverTile({super.key, required this.direction});
  final String roverNorthImagePath = 'assets/images/rover_north.png';
  final String roverEastImagePath = 'assets/images/rover_east.png';
  final String roverSouthImagePath = 'assets/images/rover_south.png';
  final String roverWestImagePath = 'assets/images/rover_west.png';
  final Direction direction;

  @override
  Widget build(BuildContext context) {
    return switch (direction) {
      Direction.east => Image.asset(
          roverEastImagePath,
        ),
      Direction.north => Image.asset(
          roverNorthImagePath,
        ),
      Direction.south => Image.asset(
          roverSouthImagePath,
        ),
      Direction.west => Image.asset(
          roverWestImagePath,
        ),
    };
  }
}
