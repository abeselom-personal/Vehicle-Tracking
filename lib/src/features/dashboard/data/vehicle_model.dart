import '../domain/entities/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  const VehicleModel({
    required super.name,
    required super.status,
    required super.location,
    super.imgUrl,
    super.fuelLevel,
    super.batteryLevel,
    super.engineTemp,
  });

  factory VehicleModel.fromEntity(VehicleEntity entity) {
    return VehicleModel(
      name: entity.name,
      status: entity.status,
      location: entity.location,
      imgUrl: entity.imgUrl,
      fuelLevel: entity.fuelLevel,
      batteryLevel: entity.batteryLevel,
      engineTemp: entity.engineTemp,
    );
  }

  VehicleEntity toEntity() {
    return VehicleEntity(
      name: name,
      status: status,
      location: location,
      imgUrl: imgUrl,
      fuelLevel: fuelLevel,
      batteryLevel: batteryLevel,
      engineTemp: engineTemp,
    );
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      name: json['name'],
      status: json['status'],
      location: json['location'],
      imgUrl: json['imgUrl'],
      fuelLevel: json['fuelLevel'],
      batteryLevel: json['batteryLevel'],
      engineTemp: json['engineTemp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
      'location': location,
      'imgUrl': imgUrl,
      'fuelLevel': fuelLevel,
      'batteryLevel': batteryLevel,
      'engineTemp': engineTemp,
    };
  }
}
