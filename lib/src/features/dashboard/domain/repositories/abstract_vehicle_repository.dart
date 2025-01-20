import 'package:dartz/dartz.dart';

import '../../../../core/network/errors/failures.dart';
import '../entities/vehicle_entity.dart';

abstract class AbstractVehicleRepository {
  /// fetch all vehicles
  Future<Either<Failure, List<VehicleEntity>>> fetchVehicles();

  /// fetch a single vehicle
  Future<Either<Failure, VehicleEntity?>> fetchVehicle(String id);

  /// update a vehicle
  Future<Either<Failure, void>> updateVehicle(VehicleEntity vehicle);
}