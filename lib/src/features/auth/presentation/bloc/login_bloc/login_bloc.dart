import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginWithCredentials>(loginWithCredentials);
  }

  Future<void> loginWithCredentials(
      LoginWithCredentials event, Emitter<LoginState> emit) async {
    emit(LoginInProgress());
    final userParams = {
      'email': event.email,
      'password': event.password,
    };
    final result = await loginUseCase.call(userParams);
    result.fold(
      (l) => emit(LoginFailure(l.errorMessage)),
      (r) => emit(
        LoginSuccess(user: r['user'], jwtToken: r['jwtToken']),
      ),
    );
  }
}
