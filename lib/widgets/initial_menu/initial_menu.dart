import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mars_rover_mission/config/styles.dart';
import 'package:mars_rover_mission/widgets/initial_menu/direction_selector.dart';
import 'package:mars_rover_mission/widgets/initial_menu/initial_menu_controller.dart';

class InitialMenu extends StatelessWidget {
  const InitialMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Styles.background,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "MARS ROVER",
                style: Styles.title,
              ),
              const Text(
                "MISSION",
                style: Styles.title,
              ),
              const SizedBox(height: 32),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'X Position',
                  hintText: 'Enter a number between 0 and 199',
                  border: InputBorder.none, // Remove underline
                  labelStyle: TextStyle(
                      color: Colors.white), // Set label text color to white
                  hintStyle: TextStyle(
                      color: Colors.white), // Set hint text color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set underline color to white
                  ),
                ),
                onChanged: (value) {
                  InitialMenuController.posX = value;
                },
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Y Position',
                  hintText: 'Enter a number between 0 and 199',
                  border: InputBorder.none, // Remove underline
                  labelStyle: TextStyle(
                      color: Colors.white), // Set label text color to white
                  hintStyle: TextStyle(
                      color: Colors.white), // Set hint text color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set underline color to white
                  ),
                ),
                onChanged: (value) {
                  InitialMenuController.posY = value;
                },
              ),
              const SizedBox(height: 50),
              const Text(
                "Select Direction",
                style: Styles.title,
              ),
              const SizedBox(height: 30),
              const DirectionSelector(),
            ],
          ),
        ),
      ),
    );
  }
}
