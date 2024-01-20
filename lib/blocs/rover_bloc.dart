import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'rover_event.dart';
part 'rover_state.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  static Timer? movementTimer;
  RoverBloc() : super(const RoverState(movements: [])) {
    on<RoverMoved>(_onRoverMoved);
    on<RoverStopped>(_onRoverStopped);
    on<RoverAddedMovement>(_onRoverAddedMovement);
    on<RoverStartsMoving>(_onRoverStartsMoving);
  }

  /* When the user presses the send button, 
  we add the movement to the list of movements */
  void _onRoverAddedMovement(
      RoverAddedMovement event, Emitter<RoverState> emit) {
    if (state.status == RoverStatus.stopped && state.movements.length < 12) {
      emit(state.copyWith(
        status: RoverStatus.stopped,
        movements: [...state.movements, event.movement],
      ));
    }
  }

  /* When the rover starts moving,
  we set the status to moving and start the timer */
  void _onRoverStartsMoving(RoverStartsMoving event, Emitter<RoverState> emit) {
    if (state.movements.isNotEmpty && state.status == RoverStatus.stopped) {
      movementTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        add(RoverMoved());
      });
      emit(state.copyWith(
        status: RoverStatus.moving,
        movements: state.movements,
      ));
    }
  }

  /* When the rover moves, we remove 
  the first movement from the list of movements */
  void _onRoverMoved(RoverMoved event, Emitter<RoverState> emit) {
    if (state.movements.isNotEmpty) {
      emit(state.copyWith(
        status: RoverStatus.moving,
        movements: state.movements.sublist(1),
      ));
    } else {
      add(RoverStopped());
    }
  }

  /* When the rover hits an obstacle, 
  we stop the rover and clear the movements*/
  void _onRoverStopped(RoverStopped event, Emitter<RoverState> emit) {
    movementTimer?.cancel();
    emit(state.copyWith(
      status: RoverStatus.stopped,
      movements: [],
    ));
  }
}
