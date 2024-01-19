import 'package:mars_rover_mission/config/config.dart';
import 'package:mars_rover_mission/entities/planet.dart';
import 'package:mars_rover_mission/entities/rover.dart';

class Camera {
  late Planet planet;
  late Rover rover;
  late List<List<PlanetElement>> cameraView;
  Camera({required this.planet, required this.rover}) {
    _loadCameraMapFromRoverPosition();
  }

  void _loadCameraMapFromRoverPosition() {
    cameraView = List.generate(Config.cameraSize, (_) {
      return List.generate(Config.cameraSize, (_) => PlanetElement.ground);
    });
    int roverX = rover.position.$1;
    int roverY = rover.position.$2;
    int cameraX = 0;
    int cameraY = 0;
    for (int x = roverX - Config.cameraSize ~/ 2;
        x < roverX + Config.cameraSize ~/ 2;
        x++) {
      for (int y = roverY - Config.cameraSize ~/ 2;
          y < roverY + Config.cameraSize ~/ 2;
          y++) {
        if (x < 0 ||
            x >= Config.planetSize ||
            y < 0 ||
            y >= Config.planetSize) {
          cameraView[cameraX][cameraY] = PlanetElement.obstacle;
        } else {
          cameraView[cameraX][cameraY] = planet.map[x][y];
        }
        cameraY++;
      }
      cameraX++;
      cameraY = 0;
    }
  }

  void moveRover(String movement) {
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
      default:
        break;
    }
    _loadCameraMapFromRoverPosition();
  }

  void _moveRoverForward() {
    planet.removeRoverPosition(rover.position);
    switch (rover.direction) {
      case Direction.north:
        rover.position = (rover.position.$1, rover.position.$2 - 1);
        break;
      case Direction.east:
        rover.position = (rover.position.$1 + 1, rover.position.$2);
        break;
      case Direction.south:
        rover.position = (rover.position.$1, rover.position.$2 + 1);
        break;
      case Direction.west:
        rover.position = (rover.position.$1 - 1, rover.position.$2);
        break;
      default:
        break;
    }
    planet.setRoverPosition(rover.position, rover.direction);
  }

  void _moveRoverLeft() {
    planet.removeRoverPosition(rover.position);
    switch (rover.direction) {
      case Direction.north:
        rover.direction = Direction.west;
        rover.position = (rover.position.$1 - 1, rover.position.$2);
        break;
      case Direction.east:
        rover.direction = Direction.north;
        rover.position = (rover.position.$1, rover.position.$2 - 1);
        break;
      case Direction.south:
        rover.direction = Direction.east;
        rover.position = (rover.position.$1 + 1, rover.position.$2);
        break;
      case Direction.west:
        rover.direction = Direction.south;
        rover.position = (rover.position.$1, rover.position.$2 + 1);
        break;
      default:
        break;
    }
    planet.setRoverPosition(rover.position, rover.direction);
  }

  void _moveRoverRight() {
    planet.removeRoverPosition(rover.position);
    switch (rover.direction) {
      case Direction.north:
        rover.direction = Direction.east;
        rover.position = (rover.position.$1 + 1, rover.position.$2);
        break;
      case Direction.east:
        rover.direction = Direction.south;
        rover.position = (rover.position.$1, rover.position.$2 + 1);
        break;
      case Direction.south:
        rover.direction = Direction.west;
        rover.position = (rover.position.$1 - 1, rover.position.$2);
        break;
      case Direction.west:
        rover.direction = Direction.north;
        rover.position = (rover.position.$1, rover.position.$2 - 1);
        break;
      default:
        break;
    }
    planet.setRoverPosition(rover.position, rover.direction);
  }
}
