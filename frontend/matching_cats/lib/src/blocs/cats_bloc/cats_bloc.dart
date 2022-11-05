import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import '../../models/cast_model.dart';
part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  var dio = Dio();
  CatsBloc() : super(CatsInitial()) {
    on<OnAddCat>(_onAddCat);
    on<OnGetOwnerCat>(_onGetOwnerCat);
    on<OnGetCats>(_onGetCats);
    on<OnGetCat>(_onGetCat);
  }

  void _onAddCat(OnAddCat event, Emitter<CatsState> emit) async {
    print("add cat");
    //emit(RegisterLoadingState());
    try {
      final response =
          await dio.post('http://192.168.1.4:4000/cats/add/', data: {
        'name': event.name,
        'owner': event.owner,
        "breed": event.breed,
        "color": event.color,
        "sex": event.sex,
        "age": event.age,
        "vaccine": event.vaccine,
        "congenitalDisease": event.congenitalDisease,
        "natureOfParenting": event.natureOfParenting,
      });
      //emit(UserRegisterSuccessState());
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onGetOwnerCat(
      OnGetOwnerCat event, Emitter<CatsState> emit) async {
    print("get cat");
    //emit(RegisterLoadingState());

    try {
      final response = await dio
          .get('http://192.168.1.4:4000/cats/owner/635a42105b0629c787124ebd');
      //print(response.data);

      emit(GetOwnerCatSuccessState(cats: response.data));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onGetCats(OnGetCats event, Emitter<CatsState> emit) async {
    print("get cat all");
    //emit(RegisterLoadingState());
    try {
      final response = await dio.get('http://192.168.1.4:4000/cats/');
      //final json = jsonDecode(response.data.toString());
      //final cats = json.map((e) => Cat.fromJson(e)).toList();
      //List<Cat> output = (json.decode(response.data) as List).cast()
      emit(GetCatsSuccessState(catsAll: response.data));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onGetCat(OnGetCat event, Emitter<CatsState> emit) async {
    print("get cat");
    //emit(RegisterLoadingState());
    final id = event.id;
    try {
      final response = await dio.get('http://192.168.1.4:4000/cats/$id');
      //final json = jsonDecode(response.data.toString());
      //final cats = json.map((e) => Cat.fromJson(e)).toList();
      //List<Cat> output = (json.decode(response.data) as List).cast()
      emit(GetCatSuccessState(cat: response.data));
    } catch (e) {
      print(e);
    }
  }
}
