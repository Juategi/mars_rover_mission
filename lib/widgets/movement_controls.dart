import 'package:flutter/material.dart';
import 'package:mars_rover_mission/blocs/text_box_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovementControls extends StatelessWidget {
  const MovementControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 60,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<TextBoxCubit>().addMovement("L");
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: IconButton(
            iconSize: 60,
            icon: const Icon(Icons.arrow_upward),
            onPressed: () {
              context.read<TextBoxCubit>().addMovement("F");
            },
          ),
        ),
        IconButton(
          iconSize: 60,
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            context.read<TextBoxCubit>().addMovement("R");
          },
        ),
      ],
    );
  }
}
