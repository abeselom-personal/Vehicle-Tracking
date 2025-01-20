import '../../domain/entities/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  const VehicleModel({
    required super.id,
    required super.name,
    required super.status,
    required super.location,
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
      location: entity.location,
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
      location: location,
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
      location: json['location'],
      imgUrl: json['imgUrl'],
      fuelLevel: json['fuelLevel'],
      mileage: json['mileage'],
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
      'mileage': mileage,
      'engineTemp': engineTemp,
    };
  }
}
