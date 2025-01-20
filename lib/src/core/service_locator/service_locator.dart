import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:vehicle_monitoring_app/src/features/dashboard/data/repositories/vehicle_repository_impl.dart';
import 'package:vehicle_monitoring_app/src/features/dashboard/domain/repositories/abstract_vehicle_repository.dart';

import '../../features/dashboard/data/data_sources/vehicle_remote_datasource_impl.dart';
import '../../features/dashboard/domain/usecases/fetch_all_vehicles_usecase.dart';
import '../../features/dashboard/domain/usecases/update_vehicle_usecase.dart';
import '../../features/dashboard/presentation/bloc/fetch_all_vehicles_bloc/fetch_all_vehicles_bloc.dart';
import '../../features/dashboard/presentation/bloc/update_vehicle_bloc/update_vehicle_bloc.dart';

final sl = GetIt.I;

Future<void> initAppInjections() async {
  ///network
  sl.registerSingleton<DatabaseReference>(FirebaseDatabase.instance.ref());

  ///data sources
  sl.registerSingleton<VehicleRemoteDatasourceImpl>(
      VehicleRemoteDatasourceImpl(sl<DatabaseReference>()));

  ///repositories
  sl.registerSingleton<VehicleRepositoryImpl>(
      VehicleRepositoryImpl(sl<VehicleRemoteDatasourceImpl>()));
  sl.registerSingleton<AbstractVehicleRepository>(sl<VehicleRepositoryImpl>());

  ///use cases
  sl.registerSingleton<FetchAllVehicleUseCase>(
      FetchAllVehicleUseCase(sl<AbstractVehicleRepository>()));
  sl.registerSingleton<UpdateVehicleUseCase>(
      UpdateVehicleUseCase(sl<AbstractVehicleRepository>()));

  ///bloc and cubit
  sl.registerFactory<FetchAllVehiclesBloc>(
      () => FetchAllVehiclesBloc(sl<FetchAllVehicleUseCase>()));
  sl.registerFactory<UpdateVehicleBloc>(
      () => UpdateVehicleBloc(sl<UpdateVehicleUseCase>()));
}
