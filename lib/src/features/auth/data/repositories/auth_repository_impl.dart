import 'package:dartz/dartz.dart';

import '../../../../core/network/errors/exceptions.dart';
import '../../../../core/network/errors/failures.dart';
import '../../domain/repositories/abstract_auth_repository.dart';
import '../data_sources/remote/abstract_auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl extends AbstractAuthRepository {
  final AbstractAuthRemoteDataSource api;

  AuthRepositoryImpl(this.api);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await api.login(email: email, password: password);
      final jwtToken = result['jwtToken'];
      final user = UserModel.fromJson(result['user']).toEntity();

      return Right({
        'jwtToken': jwtToken,
        'user': user,
      });
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), null));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result =
          await api.signup(name: name, email: email, password: password);
      final jwtToken = result['jwtToken'];
      final user = UserModel.fromJson(result['user']).toEntity();

      return Right({
        'jwtToken': jwtToken,
        'user': user,
      });
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), null));
    }
  }
}
