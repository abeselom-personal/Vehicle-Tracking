import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/vehicle_entity.dart';
import '../../../domain/usecases/fetch_all_vehicles_usecase.dart';

part 'fetch_all_vehicles_event.dart';

part 'fetch_all_vehicles_state.dart';

class FetchAllVehiclesBloc
    extends Bloc<FetchAllVehiclesEvent, FetchAllVehiclesState> {
  final FetchAllVehicleUseCase fetchAllVehiclesUseCase;

  FetchAllVehiclesBloc(this.fetchAllVehiclesUseCase)
      : super(FetchAllVehiclesInitial()) {
    on<FetchAllVehicles>(fetchAllVehicles);
  }

  /// fetch all vehicles
  void fetchAllVehicles(
      FetchAllVehicles event, Emitter<FetchAllVehiclesState> emit) async {
    emit(FetchAllVehiclesInProgress());
    final result = await fetchAllVehiclesUseCase.call();

    result.fold(
      (failure) => emit(FetchAllVehiclesFailure(failure.errorMessage)),
      (vehicles) => emit(FetchAllVehiclesSuccess(vehicles)),
    );
  }
}
