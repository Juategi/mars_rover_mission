import 'package:flutter/material.dart';
import 'package:mars_rover_mission/config/config.dart';
import 'package:mars_rover_mission/entities/camera.dart';
import 'package:mars_rover_mission/entities/planet.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/tiles/ground_tile.dart';
import 'package:mars_rover_mission/widgets/tiles/obstacle_tile.dart';
import 'package:mars_rover_mission/widgets/tiles/rover_tile.dart';

class PlanetGrid extends StatelessWidget {
  const PlanetGrid({
    super.key,
    required this.planet,
    required this.rover,
    required this.camera,
  });
  final Planet planet;
  final Rover rover;
  final Camera camera;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GridView.builder(
        itemCount: Config.cameraSize * Config.cameraSize,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Config.cameraSize,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          int x = index ~/ Config.cameraSize;
          int y = index % Config.cameraSize;
          if (camera.cameraView[x][y] == PlanetElement.roverEast ||
              camera.cameraView[x][y] == PlanetElement.roverNorth ||
              camera.cameraView[x][y] == PlanetElement.roverSouth ||
              camera.cameraView[x][y] == PlanetElement.roverWest) {
            Direction direction;
            switch (camera.cameraView[x][y]) {
              case PlanetElement.roverEast:
                direction = Direction.east;
                break;
              case PlanetElement.roverNorth:
                direction = Direction.north;
                break;
              case PlanetElement.roverSouth:
                direction = Direction.south;
                break;
              case PlanetElement.roverWest:
                direction = Direction.west;
                break;
              default:
                direction = Direction.north;
            }
            return RoverTile(
              direction: direction,
            );
          } else if (camera.cameraView[x][y] == PlanetElement.obstacle) {
            return const ObstacleTile();
          } else {
            return const GroundTile();
          }
        },
      ),
    );
  }
}
