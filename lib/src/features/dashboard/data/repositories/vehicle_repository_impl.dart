import 'package:dartz/dartz.dart';
import 'package:vehicle_monitoring_app/src/core/network/errors/exceptions.dart';

import 'package:vehicle_monitoring_app/src/core/network/errors/failures.dart';

import 'package:vehicle_monitoring_app/src/features/dashboard/domain/entities/vehicle_entity.dart';

import '../../domain/repositories/abstract_vehicle_repository.dart';
import '../data_sources/vehicle_remote_datasource_impl.dart';
import '../models/vehicle_model.dart';

class VehicleRepositoryImpl extends AbstractVehicleRepository {
  final VehicleRemoteDatasourceImpl remoteDatasource;

  VehicleRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, List<VehicleEntity>>> fetchVehicles() async {
    try {
      final result = await remoteDatasource.fetchVehicles();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, VehicleEntity?>> fetchVehicle(String id) async {
    try {
      final result = await remoteDatasource.fetchVehicle(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> updateVehicle(VehicleEntity vehicle) async {
    try {
      final result = await remoteDatasource.updateVehicle(VehicleModel.fromEntity(vehicle));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

}