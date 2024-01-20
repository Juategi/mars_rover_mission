import 'dart:math';

import 'package:mars_rover_mission/config/config.dart';
import 'package:mars_rover_mission/entities/rover.dart';

class Planet {
  late List<List<PlanetElement>> map;

  Planet() {
    _generateMapWithRandomObstacles();
  }

  /* Generates a random map with obstacles */
  void _generateMapWithRandomObstacles() {
    int obstacles = Config.obstacles;
    map = List.generate(Config.planetSize, (_) {
      return List.generate(Config.planetSize, (_) => PlanetElement.ground);
    });
    while (obstacles > 0) {
      int x = Random().nextInt(Config.planetSize);
      int y = Random().nextInt(Config.planetSize);
      if (map[x][y] == PlanetElement.ground) {
        map[x][y] = PlanetElement.obstacle;
        obstacles--;
      }
    }
  }

  /* Given the position and the direction of the rover, we will use
  different tiles when drawing the map */
  void setRoverPosition((int, int) position, Direction direction) {
    switch (direction) {
      case Direction.north:
        map[position.$1][position.$2] = PlanetElement.roverNorth;
        break;
      case Direction.east:
        map[position.$1][position.$2] = PlanetElement.roverEast;
        break;
      case Direction.south:
        map[position.$1][position.$2] = PlanetElement.roverSouth;
        break;
      case Direction.west:
        map[position.$1][position.$2] = PlanetElement.roverWest;
        break;
    }
  }

  void removeRoverPosition((int, int) position) {
    map[position.$1][position.$2] = PlanetElement.ground;
  }
}

enum PlanetElement {
  ground,
  obstacle,
  roverNorth,
  roverEast,
  roverSouth,
  roverWest
}
