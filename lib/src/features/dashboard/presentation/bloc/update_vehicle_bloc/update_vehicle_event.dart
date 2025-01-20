part of 'update_vehicle_bloc.dart';

sealed class UpdateVehicleEvent extends Equatable {
  const UpdateVehicleEvent();
}

class UpdateVehicle extends UpdateVehicleEvent {
  final VehicleEntity vehicle;

  const UpdateVehicle(this.vehicle);

  @override
  List<Object> get props => [vehicle];
}
