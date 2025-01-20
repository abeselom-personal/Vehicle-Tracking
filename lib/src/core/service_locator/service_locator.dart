import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/abstract_auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/signup_usecase.dart';
import '../../features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import '../../features/auth/presentation/bloc/signup_bloc/signup_bloc.dart';

final sl = GetIt.I;

Future<void> initAppInjections() async {
  ///network
  sl.registerSingleton<Dio>(Dio());

  ///data sources
  sl.registerSingleton<AuthRemoteDataSourceImpl>(AuthRemoteDataSourceImpl(sl<Dio>()));

  ///repositories
  sl.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(sl<AuthRemoteDataSourceImpl>()));
  sl.registerSingleton<AbstractAuthRepository>(sl<AuthRepositoryImpl>());

  ///use cases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl<AbstractAuthRepository>()));
  sl.registerSingleton<SignupUseCase>(SignupUseCase(sl<AbstractAuthRepository>()));


  ///bloc and cubit
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl<LoginUseCase>()));
  sl.registerFactory<SignupBloc>(() => SignupBloc(sl<SignupUseCase>()));
}
