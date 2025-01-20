import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  final String name;
  final String status;
  final String location;
  final String? imgUrl;
  final double? fuelLevel;
  final double? batteryLevel;
  final double? engineTemp;

  const VehicleEntity({
    required this.name,
    required this.status,
    required this.location,
    this.imgUrl,
    this.fuelLevel,
    this.batteryLevel,
    this.engineTemp,
  });

  @override
  List<Object?> get props =>
      [name, status, location, imgUrl, fuelLevel, batteryLevel, engineTemp];
}
