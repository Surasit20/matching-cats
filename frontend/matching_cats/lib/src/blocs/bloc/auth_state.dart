import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

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
