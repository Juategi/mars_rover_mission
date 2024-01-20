import 'dart:math';

import 'package:mars_rover_mission/blocs/rover_bloc.dart';
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

  bool moveRover(RoverMovement movement) {
    switch (movement) {
      case RoverMovement.forward:
        return _moveRoverForward();
      case RoverMovement.left:
        return _moveRoverLeft();
      case RoverMovement.right:
        return _moveRoverRight();
    }
  }

  bool _moveRoverForward() {
    switch (direction) {
      case Direction.north:
        return _moveToNewPosition((position.$1 - 1, position.$2));
      case Direction.east:
        return _moveToNewPosition((position.$1, position.$2 + 1));
      case Direction.south:
        return _moveToNewPosition((position.$1 + 1, position.$2));
      case Direction.west:
        return _moveToNewPosition((position.$1, position.$2 - 1));
    }
  }

  bool _moveRoverLeft() {
    switch (direction) {
      case Direction.north:
        direction = Direction.west;
        return _moveToNewPosition((position.$1, position.$2 - 1));
      case Direction.east:
        direction = Direction.north;
        return _moveToNewPosition((position.$1 - 1, position.$2));
      case Direction.south:
        direction = Direction.east;
        return _moveToNewPosition((position.$1, position.$2 + 1));
      case Direction.west:
        direction = Direction.south;
        return _moveToNewPosition((position.$1 + 1, position.$2));
    }
  }

  bool _moveRoverRight() {
    switch (direction) {
      case Direction.north:
        direction = Direction.east;
        return _moveToNewPosition((position.$1, position.$2 + 1));
      case Direction.east:
        direction = Direction.south;
        return _moveToNewPosition((position.$1 + 1, position.$2));
      case Direction.south:
        direction = Direction.west;
        return _moveToNewPosition((position.$1, position.$2 - 1));
      case Direction.west:
        direction = Direction.north;
        return _moveToNewPosition((position.$1 - 1, position.$2));
    }
  }

  bool _moveToNewPosition((int, int) newPosition) {
    if (!_isAnObstacle(newPosition)) {
      planet.removeRoverPosition(position);
      position = newPosition;
      planet.setRoverPosition(position, direction);
      return true;
    } else {
      /* Rover has hit an obstacle, but we still need to update the map
      because while the position is be the same, the direction 
      might be different */
      planet.removeRoverPosition(position);
      planet.setRoverPosition(position, direction);
      return false;
    }
  }

  bool _isAnObstacle((int, int) newPosition) {
    if (newPosition.$1 < 0 ||
        newPosition.$1 >= Config.planetSize ||
        newPosition.$2 < 0 ||
        newPosition.$2 >= Config.planetSize) {
      return true;
    }
    return planet.map[newPosition.$1][newPosition.$2] == PlanetElement.obstacle;
  }
}

enum Direction { north, east, south, west }
