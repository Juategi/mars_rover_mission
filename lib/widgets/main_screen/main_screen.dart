import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/blocs/rover_bloc.dart';
import 'package:mars_rover_mission/config/styles.dart';
import 'package:mars_rover_mission/entities/camera.dart';
import 'package:mars_rover_mission/entities/planet.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/main_screen/movement_controls.dart';
import 'package:mars_rover_mission/widgets/main_screen/planet_grid.dart';
import 'package:mars_rover_mission/widgets/other/snackbar.dart';

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
        camera.loadCameraMapFromRoverPosition();
        if (!hasMoved) {
          // Rover has hit an obstacle
          WidgetsBinding.instance.addPostFrameCallback((_) {
            MySnackBar.showSnackBar(context, "Rover hit an obstacle");
          });
          context.read<RoverBloc>().add(RoverStopped());
        }
      }
      return Scaffold(
        body: Container(
          decoration: Styles.background,
          child: Column(
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
                        padding: const EdgeInsets.only(
                            bottom: 50, left: 20, right: 20),
                        child: Text(
                          state.movements.map((e) => e.toString()).join(""),
                          style: Styles.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MovementControls(),
            ],
          ),
        ),
      );
    });
  }
}
