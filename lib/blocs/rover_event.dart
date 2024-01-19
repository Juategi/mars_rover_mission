part of 'rover_bloc.dart';

sealed class RoverEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class RoverAddedMovement extends RoverEvent {
  RoverAddedMovement(this.movement);

  final String movement;

  @override
  List<Object> get props => [movement];
}

final class RoverMoved extends RoverEvent {}

final class RoverStopped extends RoverEvent {}
