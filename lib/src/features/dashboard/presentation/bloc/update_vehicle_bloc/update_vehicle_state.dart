part of 'update_vehicle_bloc.dart';

sealed class UpdateVehicleState extends Equatable {
  const UpdateVehicleState();
}

final class UpdateVehicleInitial extends UpdateVehicleState {
  @override
  List<Object> get props => [];
}

final class UpdateVehicleInProgress extends UpdateVehicleState {
  @override
  List<Object> get props => [];
}

final class UpdateVehicleSuccess extends UpdateVehicleState {
  final String message;

  const UpdateVehicleSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class UpdateVehicleFailure extends UpdateVehicleState {
  final String message;

  const UpdateVehicleFailure(this.message);

  @override
  List<Object> get props => [message];
}
