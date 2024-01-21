import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/blocs/rover_bloc.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/main_screen/main_screen.dart';
import 'package:mars_rover_mission/widgets/other/snackbar.dart';

class InitialMenuController {
  static String posX = "";
  static String posY = "";
  static Direction direction = Direction.north;

  static void deployRover(BuildContext context, Direction directionSelected) {
    int? x = int.tryParse(posX);
    int? y = int.tryParse(posY);
    if (x == null || x > 199 || y == null || y > 199) {
      MySnackBar.showSnackBar(context, "Invalid coordinates");
      return;
    }
    direction = directionSelected;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<RoverBloc>(
          create: (BuildContext context) => RoverBloc(),
          child: const MainScreen(),
        ),
      ),
    );
  }
}
