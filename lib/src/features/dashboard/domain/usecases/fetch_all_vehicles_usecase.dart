import 'package:dartz/dartz.dart';

import '../../../../core/network/errors/failures.dart';
import '../entities/vehicle_entity.dart';
import '../repositories/abstract_vehicle_repository.dart';

class FetchAllVehicleUseCase {
  final AbstractVehicleRepository repository;

  FetchAllVehicleUseCase(this.repository);

  Future<Either<Failure, List<VehicleEntity>>> call() async {
    final result = await repository.fetchVehicles();

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
