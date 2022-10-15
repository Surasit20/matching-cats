part of 'test_bloc.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class AuthInitial extends TestState {}

class AuthLoading extends TestState {}

class AuthLoaded extends TestState {
  final String username;

  AuthLoaded(
    this.username,
  );
}

class AuthError extends TestState {}
