part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class LoginWithCredentials extends LoginEvent {
  final String email;
  final String password;

  const LoginWithCredentials({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
