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
  String selectedPoint = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 282,
      child: Row(
        children: [
          SelectorButton(
            onPressed: () => {
              setState(() {
                selectedPoint = "W";
                InitialMenuController.direction = Direction.west;
              })
            },
            cardinalPoint: "W",
            selectedPoint: selectedPoint,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SelectorButton(
                  onPressed: () => {
                    setState(() {
                      selectedPoint = "N";
                      InitialMenuController.direction = Direction.north;
                    })
                  },
                  cardinalPoint: "N",
                  selectedPoint: selectedPoint,
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
                      selectedPoint = "S";
                      InitialMenuController.direction = Direction.south;
                    })
                  },
                  cardinalPoint: "S",
                  selectedPoint: selectedPoint,
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
                selectedPoint = "E";
                InitialMenuController.direction = Direction.east;
              })
            },
            cardinalPoint: "E",
            selectedPoint: selectedPoint,
          ),
        ],
      ),
    );
  }
}
