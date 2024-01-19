import 'package:flutter/material.dart';
import 'package:mars_rover_mission/entities/camera.dart';
import 'package:mars_rover_mission/entities/planet.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/planet_grid.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Planet planet;
  late Rover rover;
  late Camera camera;

  @override
  void initState() {
    planet = Planet();
    rover = Rover(planet: planet);
    camera = Camera(planet: planet, rover: rover);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlanetGrid(
          planet: planet,
          rover: rover,
          camera: camera,
        ),
      ),
    );
  }
}
