import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  var dio = Dio();
  TestBloc() : super(AuthInitial()) {
    on<TestEvent>((event, emit) async {
      if (event is Register) {
        print("Register");

        emit(AuthLoading());

        try {
          var response = await Dio().get('http://192.168.1.4:4000/users/test');
          final response1 = await dio.post(
              'http://192.168.1.4:4000/users/register',
              data: {'name': "test", 'email': 'wendu', "password": "dfgdfg"});
          print(response);
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
