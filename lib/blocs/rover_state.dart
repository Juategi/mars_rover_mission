part of 'rover_bloc.dart';

enum RoverStatus { moving, stopped }

enum RoverMovement {
  forward,
  left,
  right;

  @override
  String toString() {
    switch (this) {
      case RoverMovement.forward:
        return "F";
      case RoverMovement.left:
        return "L";
      case RoverMovement.right:
        return "R";
    }
  }
}

final class RoverState extends Equatable {
  const RoverState({
    this.status = RoverStatus.stopped,
    required this.movements,
  });

  final RoverStatus status;
  final List<RoverMovement> movements;

  @override
  List<Object?> get props => [status, movements];

  RoverState copyWith({
    RoverStatus? status,
    List<RoverMovement>? movements,
  }) {
    return RoverState(
      status: status ?? this.status,
      movements: movements ?? this.movements,
    );
  }
}
