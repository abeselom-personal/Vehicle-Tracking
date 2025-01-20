part of 'fetch_all_vehicles_bloc.dart';

sealed class FetchAllVehiclesState extends Equatable {
  const FetchAllVehiclesState();
}

final class FetchAllVehiclesInitial extends FetchAllVehiclesState {
  @override
  List<Object> get props => [];
}

final class FetchAllVehiclesInProgress extends FetchAllVehiclesState {
  @override
  List<Object> get props => [];
}

final class FetchAllVehiclesSuccess extends FetchAllVehiclesState {
  final List<VehicleEntity> vehicles;

  const FetchAllVehiclesSuccess(this.vehicles);

  @override
  List<Object> get props => [vehicles];
}

final class FetchAllVehiclesFailure extends FetchAllVehiclesState {
  final String message;

  const FetchAllVehiclesFailure(this.message);

  @override
  List<Object> get props => [message];
}
