part of 'rover_bloc.dart';

sealed class RoverEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class RoverMoved extends RoverEvent {}

final class RoverStopped extends RoverEvent {}
