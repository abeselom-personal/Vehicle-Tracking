import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  final String id;
  final String name;
  final String status;
  final String location;
  final String? imgUrl;
  final double? fuelLevel;
  final double? mileage;
  final double? engineTemp;

  const VehicleEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.location,
    this.imgUrl,
    this.fuelLevel,
    this.mileage,
    this.engineTemp,
  });

  @override
  List<Object?> get props =>
      [id, name, status, location, imgUrl, fuelLevel, mileage, engineTemp];
}
