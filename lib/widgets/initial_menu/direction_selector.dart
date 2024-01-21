import 'package:flutter/material.dart';

import 'package:mars_rover_mission/config/styles.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/initial_menu/compass.dart';
import 'package:mars_rover_mission/widgets/initial_menu/initial_menu_controller.dart';

class DirectionSelector extends StatelessWidget {
  const DirectionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              InitialMenuController.deployRover(context, Direction.west);
            },
            child: const Text(
              "W",
              style: Styles.textStyle,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    InitialMenuController.deployRover(context, Direction.north);
                  },
                  child: const Text(
                    "N",
                    style: Styles.textStyle,
                  ),
                ),
              ),
              const Compass(),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    InitialMenuController.deployRover(context, Direction.south);
                  },
                  child: const Text(
                    "S",
                    style: Styles.textStyle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              InitialMenuController.deployRover(context, Direction.east);
            },
            child: const Text(
              "E",
              style: Styles.textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
