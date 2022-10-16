import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  var dio = Dio();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is OnRegister) {
        print("Register");

        emit(RegisterLoadingState());

        try {
          var response = await Dio().get('http://192.168.1.4:4000/users/test');
          final response1 = await dio
              .post('http://192.168.1.4:4000/users/register', data: {
            'name': event.username,
            'email': event.email,
            "password": event.password
          });
          print(response);
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
