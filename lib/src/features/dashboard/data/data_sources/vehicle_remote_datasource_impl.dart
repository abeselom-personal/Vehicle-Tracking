import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vehicle_monitoring_app/src/core/network/errors/exceptions.dart';
import 'package:vehicle_monitoring_app/src/features/dashboard/data/models/vehicle_model.dart';

import 'abstract_vehicle_remote_datasource.dart';

class VehicleRemoteDatasourceImpl implements AbstractVehicleRemoteDataSource {
  ///firebase database
  final DatabaseReference _databaseReference;

  VehicleRemoteDatasourceImpl(this._databaseReference);

  @override
  Future<List<VehicleModel>> fetchVehicles() async {
    try {
      print('Fetching vehicles');
      final snapshot = await _databaseReference.child('vehicles').get();

      if (snapshot.exists) {
        final vehiclesData = snapshot.value as Map<dynamic, dynamic>;
        final vehicles = vehiclesData.entries.map((entry) {
          final vehicleJson = Map<String, dynamic>.from(entry.value);
          return VehicleModel.fromJson(vehicleJson);
        }).toList();
        print('No vehicles found ss');
        return vehicles;
      } else {
        print('No vehicles found');
        return [];
      }
    } on FirebaseException catch (e, stackTrace) {
      print('FirebaseException: $e');
      print('Stacktrace: $stackTrace');
      if (e is SocketException) {
        throw ServerException('No Internet Connection', 101);
      }
      throw ServerException(e.message ?? 'Something went wrong', 101);
    } on SocketException catch (e) {
      print('SocketException: $e');
      throw Exception('Failed to fetch vehicles: $e');
    } on ServerException catch (e) {
      print('ServerException: $e');
      throw ServerException('Failed to fetch vehicles: $e', e.statusCode);
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to fetch vehicles: $e');
    }
  }

  @override
  Future<VehicleModel?> fetchVehicle(String id) async {
    try {
      final result = await _databaseReference.child('vehicles').child(id).get();

      if (result.exists) {
        final vehicleJson = Map<String, dynamic>.from(result.value as Map);
        return VehicleModel.fromJson(vehicleJson);
      } else {
        return null;
      }
    } on FirebaseException catch (e, stackTrace) {
      print('FirebaseException: $e');
      print('Stacktrace: $stackTrace');
      if (e is SocketException) {
        throw ServerException('No Internet Connection', 101);
      }
      throw ServerException(e.message ?? 'Something went wrong', 101);
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to fetch vehicles: $e');
    }
  }

  @override
  Future<void> updateVehicle(VehicleModel vehicle) async {
    try{
      final result = await _databaseReference.child('vehicles').child(vehicle.id).update(vehicle.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: 'VehicleRemoteDatasourceImpl', message: e.message);
    } catch (e) {
      throw Exception('Failed to fetch vehicles: $e');
    }
  }
}
