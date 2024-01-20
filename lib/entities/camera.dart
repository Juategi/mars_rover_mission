import 'package:mars_rover_mission/config/config.dart';
import 'package:mars_rover_mission/entities/planet.dart';
import 'package:mars_rover_mission/entities/rover.dart';

class Camera {
  late Planet planet;
  late Rover rover;
  late List<List<PlanetElement>> cameraView;
  Camera({required this.planet, required this.rover}) {
    loadCameraMapFromRoverPosition();
  }

  void loadCameraMapFromRoverPosition() {
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
}
