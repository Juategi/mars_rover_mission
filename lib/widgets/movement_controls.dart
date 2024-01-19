import 'package:flutter/material.dart';
import 'package:mars_rover_mission/blocs/text_box_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            onPressed: () {
              context.read<TextBoxCubit>().addMovement("L");
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
                  onPressed: () {
                    context.read<TextBoxCubit>().addMovement("F");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  child: Text(
                    "SEND",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  onPressed: () {
                    context.read<TextBoxCubit>().removeMovement();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          IconButton(
            iconSize: 60,
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              context.read<TextBoxCubit>().addMovement("R");
            },
          ),
        ],
      ),
    );
  }
}
