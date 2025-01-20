import '../../domain/entities/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  const VehicleModel({
    required super.id,
    required super.name,
    required super.status,
    required super.locationName,
    super.latitude,
    super.longitude,
    super.imgUrl,
    super.fuelLevel,
    super.mileage,
    super.engineTemp,
  });

  factory VehicleModel.fromEntity(VehicleEntity entity) {
    return VehicleModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      locationName: entity.locationName,
      latitude: entity.latitude ?? 0.0,
      longitude: entity.longitude ?? 0.0,
      imgUrl: entity.imgUrl,
      fuelLevel: entity.fuelLevel,
      mileage: entity.mileage,
      engineTemp: entity.engineTemp,
    );
  }

  VehicleEntity toEntity() {
    return VehicleEntity(
      id: id,
      name: name,
      status: status,
      locationName: locationName,
      latitude: latitude,
      longitude: longitude,
      imgUrl: imgUrl,
      fuelLevel: fuelLevel,
      mileage: mileage,
      engineTemp: engineTemp,
    );
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      locationName: json['locationName'],
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      imgUrl: json['imgUrl'],
      fuelLevel: (json['fuelLevel'] ?? 0.0).toDouble(),
      engineTemp: (json['engineTemp'] ?? 0.0).toDouble(),
      mileage: (json['mileage'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'locationName': locationName,
      'latitude': latitude,
      'longitude': longitude,
      'imgUrl': imgUrl,
      'fuelLevel': fuelLevel,
      'mileage': mileage,
      'engineTemp': engineTemp,
    };
  }
}