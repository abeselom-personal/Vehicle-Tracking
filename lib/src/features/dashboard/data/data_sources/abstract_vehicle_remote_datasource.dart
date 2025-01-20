import '../models/vehicle_model.dart';

abstract class AbstractVehicleRemoteDataSource {
  Future<List<VehicleModel>> fetchVehicles();

  Future<VehicleModel> fetchVehicle(String id);

  Future<void> updateVehicle(VehicleModel vehicle);
}