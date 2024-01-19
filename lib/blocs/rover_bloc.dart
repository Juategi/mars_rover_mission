import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'rover_event.dart';
part 'rover_state.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  static Timer? movementTimer;
  RoverBloc() : super(const RoverState()) {
    on<RoverMoved>(_onRoverMoved);
    on<RoverStopped>(_onRoverStopped);
    on<RoverAddedMovement>(_onRoverAddedMovement);
    on<RoverStartsMoving>(_onRoverStartsMoving);
  }

  void _onRoverAddedMovement(
      RoverAddedMovement event, Emitter<RoverState> emit) {
    if (state.status == RoverStatus.stopped && state.movements.length < 12) {
      emit(state.copyWith(
        status: RoverStatus.stopped,
        movements: state.movements + event.movement,
      ));
    }
  }

  void _onRoverStartsMoving(RoverStartsMoving event, Emitter<RoverState> emit) {
    emit(state.copyWith(
      status: RoverStatus.moving,
      movements: state.movements,
    ));
  }

  void _onRoverMoved(RoverMoved event, Emitter<RoverState> emit) {
    if (state.movements.isNotEmpty) {
      emit(state.copyWith(
        status: RoverStatus.moving,
        movements: state.movements.substring(1),
      ));
    } else {
      movementTimer?.cancel();
      emit(state.copyWith(
        status: RoverStatus.stopped,
        movements: "",
      ));
    }
  }

  void _onRoverStopped(RoverStopped event, Emitter<RoverState> emit) {
    movementTimer?.cancel();
    emit(state.copyWith(
      status: RoverStatus.stopped,
      movements: "",
    ));
  }
}
