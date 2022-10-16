part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class AdminLoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;
  LoginErrorState({required this.message});
}

class RegisterInitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class UserRegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String message;
  RegisterErrorState({required this.message});
}
