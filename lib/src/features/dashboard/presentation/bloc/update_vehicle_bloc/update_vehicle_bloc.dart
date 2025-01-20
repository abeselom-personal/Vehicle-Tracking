import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/vehicle_entity.dart';
import '../../../domain/usecases/update_vehicle_usecase.dart';

part 'update_vehicle_event.dart';
part 'update_vehicle_state.dart';

class UpdateVehicleBloc extends Bloc<UpdateVehicleEvent, UpdateVehicleState> {
  final UpdateVehicleUseCase updateVehicleUseCase;
  UpdateVehicleBloc(this.updateVehicleUseCase) : super(UpdateVehicleInitial()) {
    on<UpdateVehicle>(updateVehicle);
  }

  void updateVehicle(UpdateVehicle event, Emitter<UpdateVehicleState> emit) async {
    emit(UpdateVehicleInProgress());
    final result = await updateVehicleUseCase.call(event.vehicle);

    result.fold(
      (failure) => emit(UpdateVehicleFailure(failure.errorMessage)),
      (vehicles) => emit(UpdateVehicleSuccess('Vehicle updated successfully')),
    );
  }
}
