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
          fit: BoxFit.fill,
        ),
      Direction.north => Image.asset(
          roverNorthImagePath,
          fit: BoxFit.fill,
        ),
      Direction.south => Image.asset(
          roverSouthImagePath,
          fit: BoxFit.fill,
        ),
      Direction.west => Image.asset(
          roverWestImagePath,
          fit: BoxFit.fill,
        ),
    };
  }
}
