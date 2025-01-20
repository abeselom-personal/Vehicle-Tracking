part of 'fetch_all_vehicles_bloc.dart';

sealed class FetchAllVehiclesEvent extends Equatable {
  const FetchAllVehiclesEvent();
}

class FetchAllVehicles extends FetchAllVehiclesEvent {
  const FetchAllVehicles();

  @override
  List<Object> get props => [];
}
