import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/signup_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signupUseCase;
  SignupBloc(this.signupUseCase) : super(SignupInitial()) {
    on<SignupWithCredentials>(signupWithCredentials);
  }

  Future<void> signupWithCredentials(
      SignupWithCredentials event, Emitter<SignupState> emit) async {
    emit(SignupInProgress());
    final userParams = {
      'name': event.name,
      'email': event.email,
      'password': event.password,
    };
    final result = await signupUseCase.call(userParams);

    result.fold(
      (l) => emit(SignupFailure(l.errorMessage)),
      (r) => emit(
        SignupSuccess(user: r['user'], jwtToken: r['jwtToken']),
      ),
    );
  }
}
