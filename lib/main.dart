import 'package:flutter/material.dart';
import 'package:mars_rover_mission/widgets/initial_menu/initial_menu.dart';

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
      home: const InitialMenu(),
    );
  }
}
