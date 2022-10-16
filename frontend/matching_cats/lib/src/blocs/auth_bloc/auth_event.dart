part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class StartEvent extends AuthEvent {}

class OnLogin extends AuthEvent {
  final String email;
  final String password;
  OnLogin({required this.email, required this.password});
}

class OnRegister extends AuthEvent {
  final String email;
  final String password;
  final String username;
  OnRegister({
    required this.email,
    required this.password,
    required this.username,
  });
}
