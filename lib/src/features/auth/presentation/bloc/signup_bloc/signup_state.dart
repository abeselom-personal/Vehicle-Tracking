part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();
}

final class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

final class SignupInProgress extends SignupState {
  @override
  List<Object> get props => [];
}

final class SignupSuccess extends SignupState {
  final String jwtToken;
  final UserEntity user;

  const SignupSuccess({required this.jwtToken, required this.user});

  @override
  List<Object> get props => [jwtToken, user];
}

final class SignupFailure extends SignupState {
  final String errorMessage;

  const SignupFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
