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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: Styles.background,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "MARS ROVER",
                style: Styles.textStyle,
              ),
              const Text(
                "MISSION",
                style: Styles.textStyle,
              ),
              const SizedBox(height: 32),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(color: Colors.white),
                decoration: Styles.inputDecoration.copyWith(
                  labelText: 'X Position',
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
                decoration: Styles.inputDecoration.copyWith(
                  labelText: 'Y Position',
                ),
                onChanged: (value) {
                  InitialMenuController.posY = value;
                },
              ),
              const SizedBox(height: 50),
              const Text(
                "Select Direction",
                style: Styles.textStyle,
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
