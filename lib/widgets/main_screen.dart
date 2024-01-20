import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/blocs/rover_bloc.dart';
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
    return BlocBuilder<RoverBloc, RoverState>(builder: (context, state) {
      if (state.status == RoverStatus.moving && state.movements.isNotEmpty) {
        bool hasMoved = rover.moveRover(state.movements[0]);
        if (hasMoved) {
          camera.loadCameraMapFromRoverPosition();
        } else {
          context.read<RoverBloc>().add(RoverStopped());
        }
      }
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
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        state.movements.map((e) => e.toString()).join(" "),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const MovementControls(),
          ],
        ),
      );
    });
  }
}
