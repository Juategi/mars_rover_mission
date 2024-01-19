import 'dart:math';

import 'package:mars_rover_mission/config/config.dart';
import 'package:mars_rover_mission/entities/planet.dart';

class Rover {
  late Planet planet;
  late (int, int) position;
  late Direction direction;

  Rover({required this.planet}) {
    _deployRoverOnRandomPosition();
  }

  void _deployRoverOnRandomPosition() {
    int x = Random().nextInt(Config.planetSize);
    int y = Random().nextInt(Config.planetSize);
    while (planet.map[x][y] == PlanetElement.obstacle) {
      x = Random().nextInt(Config.planetSize);
      y = Random().nextInt(Config.planetSize);
    }
    position = (x, y);
    direction = Direction.values[Random().nextInt(Direction.values.length)];
    planet.setRoverPosition(position, direction);
  }
}

enum Direction { north, east, south, west }
