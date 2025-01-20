part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();
}

final class SignupWithCredentials extends SignupEvent {
  final String name;
  final String email;
  final String password;

  const SignupWithCredentials({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}
