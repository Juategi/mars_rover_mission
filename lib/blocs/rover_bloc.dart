import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'rover_event.dart';
part 'rover_state.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  RoverBloc() : super(const RoverState()) {
    on<RoverMoved>(_onRoverMoved);
    on<RoverStopped>(_onRoverStopped);
  }

  void _onRoverMoved(RoverMoved event, Emitter<RoverState> emit) {
    emit(state.copyWith(
      status: RoverStatus.moving,
      movements: state.movements.substring(1),
    ));
  }

  void _onRoverStopped(RoverStopped event, Emitter<RoverState> emit) {
    emit(state.copyWith(status: RoverStatus.stopped, movements: ""));
  }
}
