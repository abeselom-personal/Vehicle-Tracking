import 'package:vehicle_monitoring_app/src/features/dashboard/data/models/vehicle_model.dart';

import 'abstract_vehicle_remote_datasource.dart';

class VehicleRemoteDatasourceImpl implements AbstractVehicleRemoteDataSource {
  @override
  Future<VehicleModel> fetchVehicle(String id) {
    // TODO: implement fetchVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<VehicleModel>> fetchVehicles() {
    // TODO: implement fetchVehicles
    throw UnimplementedError();
  }

  @override
  Future<void> updateVehicle(VehicleModel vehicle) {
    // TODO: implement updateVehicle
    throw UnimplementedError();
  }


}