import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/blocs/rover_bloc.dart';
import 'package:mars_rover_mission/widgets/main_screen.dart';
import 'package:mars_rover_mission/widgets/select_rover_position.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Rover Mission',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider<RoverBloc>(
        create: (BuildContext context) => RoverBloc(),
        child: const SelectRoverPosition(),
      ),
    );
  }
}
