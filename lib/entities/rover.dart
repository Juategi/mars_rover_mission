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

  void moveRover(String movement) {
    planet.removeRoverPosition(position);
    switch (movement) {
      case "F":
        _moveRoverForward();
        break;
      case "L":
        _moveRoverLeft();
        break;
      case "R":
        _moveRoverRight();
        break;
    }
    planet.setRoverPosition(position, direction);
  }

  void _moveRoverForward() {
    switch (direction) {
      case Direction.north:
        position = (position.$1 - 1, position.$2);
        break;
      case Direction.east:
        position = (position.$1, position.$2 + 1);
        break;
      case Direction.south:
        position = (position.$1 + 1, position.$2);
        break;
      case Direction.west:
        position = (position.$1, position.$2 - 1);
        break;
      default:
        break;
    }
  }

  void _moveRoverLeft() {
    switch (direction) {
      case Direction.north:
        direction = Direction.west;
        position = (position.$1, position.$2 - 1);
        break;
      case Direction.east:
        direction = Direction.north;
        position = (position.$1 - 1, position.$2);
        break;
      case Direction.south:
        direction = Direction.east;
        position = (position.$1, position.$2 + 1);
        break;
      case Direction.west:
        direction = Direction.south;
        position = (position.$1 + 1, position.$2);
        break;
      default:
        break;
    }
  }

  void _moveRoverRight() {
    switch (direction) {
      case Direction.north:
        direction = Direction.east;
        position = (position.$1, position.$2 + 1);
        break;
      case Direction.east:
        direction = Direction.south;
        position = (position.$1 + 1, position.$2);
        break;
      case Direction.south:
        direction = Direction.west;
        position = (position.$1, position.$2 - 1);
        break;
      case Direction.west:
        direction = Direction.north;
        position = (position.$1 - 1, position.$2);
        break;
      default:
        break;
    }
  }
}

enum Direction { north, east, south, west }
