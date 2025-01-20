import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  final String id;
  final String name;
  final String status;
  final String locationName;
  final double? latitude;
  final double? longitude;
  final String? imgUrl;
  final double? fuelLevel;
  final double? mileage;
  final double? engineTemp;

  const VehicleEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.locationName,
    this.latitude,
    this.longitude,
    this.imgUrl,
    this.fuelLevel,
    this.mileage,
    this.engineTemp,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        locationName,
        latitude,
        longitude,
        imgUrl,
        fuelLevel,
        mileage,
        engineTemp,
      ];
}
