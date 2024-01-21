import 'package:flutter/material.dart';
import 'package:mars_rover_mission/blocs/rover_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/config/styles.dart';

class MovementControls extends StatelessWidget {
  const MovementControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 60,
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              context
                  .read<RoverBloc>()
                  .add(RoverAddedMovement(RoverMovement.left));
            },
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: IconButton(
                  iconSize: 60,
                  icon: const Icon(Icons.arrow_upward),
                  color: Colors.white,
                  onPressed: () {
                    context
                        .read<RoverBloc>()
                        .add(RoverAddedMovement(RoverMovement.forward));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  child: const Text(
                    "SEND",
                    style: Styles.title,
                  ),
                  onPressed: () {
                    context.read<RoverBloc>().add(RoverStartsMoving());
                  },
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          IconButton(
            iconSize: 60,
            icon: const Icon(Icons.arrow_forward),
            color: Colors.white,
            onPressed: () {
              context
                  .read<RoverBloc>()
                  .add(RoverAddedMovement(RoverMovement.right));
            },
          ),
        ],
      ),
    );
  }
}
