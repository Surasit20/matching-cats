part of 'test_bloc.dart';

@immutable
abstract class TestEvent {}

class Register extends TestEvent {
  final String email;
  final String password;

  Register({
    required this.email,
    required this.password,
  });
}
