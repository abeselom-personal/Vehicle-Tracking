import 'package:dartz/dartz.dart';
import 'package:vehicle_monitoring_app/src/features/dashboard/domain/entities/vehicle_entity.dart';
import 'package:vehicle_monitoring_app/src/features/dashboard/domain/repositories/abstract_vehicle_repository.dart';

import '../../../../core/network/errors/failures.dart';

class UpdateVehicleUseCase {
  final AbstractVehicleRepository repository;

  UpdateVehicleUseCase(this.repository);

  Future<Either<Failure, void>> call(VehicleEntity vehicle) async {
    final result = await repository.updateVehicle(vehicle);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}