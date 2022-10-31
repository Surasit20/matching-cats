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
        //emit(RegisterLoadingState());
        try {
          final response = await dio
              .post('http://192.168.1.4:4000/users/register', data: {
            'userName': event.username,
            'email': event.email,
            "password": event.password
          });
          //emit(UserRegisterSuccessState());
          print(response);
        } catch (e) {
          print(e);
        }
      } else if (event is OnLogin) {
        print("Login");
        //emit(LoginLoadingState());
        try {
          final response = await dio.post('http://192.168.1.4:4000/users/login',
              data: {'email': event.email, "password": event.password});

          print(response);
          if (response.statusCode == 200) {
            emit(UserLoginSuccessState());
          }
        } catch (e) {
          emit(LoginErrorState(message: e.toString()));
          print(e);
          print("rfghfghrty");
        }
      }
    });
  }
}
