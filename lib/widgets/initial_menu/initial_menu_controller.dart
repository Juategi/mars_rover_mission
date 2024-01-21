import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/blocs/rover_bloc.dart';
import 'package:mars_rover_mission/config/config.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/main_screen/main_screen.dart';
import 'package:mars_rover_mission/widgets/other/snackbar.dart';

class InitialMenuController {
  static String posX = "";
  static String posY = "";
  static Direction? direction;

  static void deployRover(BuildContext context) {
    int? x = int.tryParse(posX);
    int? y = int.tryParse(posY);
    if (x == null ||
        x > Config.planetSize - 1 ||
        y == null ||
        y > Config.planetSize - 1 ||
        direction == null) {
      MySnackBar.showSnackBar(context, "Invalid coordinates or direction",
          heightOffset: 0.1);
      return;
    }
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
