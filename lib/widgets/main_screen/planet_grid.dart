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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: Colors.transparent,
        child: GridView.builder(
          itemCount: Config.cameraSize * Config.cameraSize,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Config.cameraSize,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            int x = index ~/ Config.cameraSize;
            int y = index % Config.cameraSize;
            PlanetElement element = camera.cameraView[x][y];
            switch (element) {
              case PlanetElement.roverEast:
                return const RoverTile(
                  direction: Direction.east,
                );
              case PlanetElement.roverNorth:
                return const RoverTile(
                  direction: Direction.north,
                );
              case PlanetElement.roverSouth:
                return const RoverTile(
                  direction: Direction.south,
                );
              case PlanetElement.roverWest:
                return const RoverTile(
                  direction: Direction.west,
                );
              case PlanetElement.obstacle:
                return const ObstacleTile();
              default:
                return const GroundTile();
            }
          },
        ),
      ),
    );
  }
}
