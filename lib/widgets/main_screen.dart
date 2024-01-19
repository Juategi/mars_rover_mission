import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/blocs/text_box_cubit.dart';
import 'package:mars_rover_mission/entities/camera.dart';
import 'package:mars_rover_mission/entities/planet.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/movement_controls.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                PlanetGrid(
                  planet: planet,
                  rover: rover,
                  camera: camera,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: BlocBuilder<TextBoxCubit, String>(
                      builder: (context, text) {
                        return Text(
                          text,
                          style: Theme.of(context).textTheme.headlineSmall,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const MovementControls(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rover position: ${rover.position}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
