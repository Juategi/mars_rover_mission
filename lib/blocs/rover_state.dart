part of 'rover_bloc.dart';

enum RoverStatus { moving, stopped }

final class RoverState extends Equatable {
  const RoverState({
    this.status = RoverStatus.stopped,
    this.movements = "",
  });

  final RoverStatus status;
  final String movements;

  @override
  List<Object?> get props => [status, movements];

  RoverState copyWith({
    RoverStatus? status,
    String? movements,
  }) {
    return RoverState(
      status: status ?? this.status,
      movements: movements ?? this.movements,
    );
  }
}
