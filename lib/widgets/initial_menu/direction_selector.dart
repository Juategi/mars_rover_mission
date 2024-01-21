import 'package:flutter/material.dart';
import 'package:mars_rover_mission/entities/rover.dart';
import 'package:mars_rover_mission/widgets/initial_menu/compass.dart';
import 'package:mars_rover_mission/widgets/initial_menu/initial_menu_controller.dart';
import 'package:mars_rover_mission/widgets/initial_menu/selector_button.dart';

class DirectionSelector extends StatefulWidget {
  const DirectionSelector({Key? key}) : super(key: key);

  @override
  State<DirectionSelector> createState() => _DirectionSelectorState();
}

class _DirectionSelectorState extends State<DirectionSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295,
      child: Row(
        children: [
          SelectorButton(
            onPressed: () => {
              setState(() {
                InitialMenuController.direction = Direction.west;
              })
            },
            cardinalPoint: Direction.west,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SelectorButton(
                  onPressed: () => {
                    setState(() {
                      InitialMenuController.direction = Direction.north;
                    })
                  },
                  cardinalPoint: Direction.north,
                ),
              ),
              const Compass(),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SelectorButton(
                  onPressed: () => {
                    setState(() {
                      InitialMenuController.direction = Direction.south;
                    })
                  },
                  cardinalPoint: Direction.south,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          SelectorButton(
            onPressed: () => {
              setState(() {
                InitialMenuController.direction = Direction.east;
              })
            },
            cardinalPoint: Direction.east,
          ),
        ],
      ),
    );
  }
}
