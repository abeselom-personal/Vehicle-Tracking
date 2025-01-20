import 'package:dartz/dartz.dart';

import '../../../../core/network/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/abstract_auth_repository.dart';

class SignupUseCase
    extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  final AbstractAuthRepository authRepository;

  SignupUseCase(this.authRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      Map<String, dynamic>? params) async {
    final result = await authRepository.signup(
        name: params?['name'],
        email: params?['email'],
        password: params?['password']);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
