import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import '../../models/cast_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  static const uri = "http://10.10.10.95";
  var dio = Dio();
  CatsBloc() : super(CatsInitial()) {
    on<OnAddCat>(_onAddCat);
    on<OnGetOwnerCat>(_onGetOwnerCat);
    on<OnGetCats>(_onGetCats);
    on<OnGetCat>(_onGetCat);
    on<OnUploadImageCat>(_onUploadImageCat);
  }

  void _onAddCat(OnAddCat event, Emitter<CatsState> emit) async {
    print("add cat");
    //emit(RegisterLoadingState());
    try {
      final response = await dio.post('$uri:4000/cats/add/', data: {
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
      final response =
          await dio.get('$uri:4000/cats/owner/635a42105b0629c787124ebd');
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
      final response = await dio.get('$uri:4000/cats/');
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
      final response = await dio.get('$uri:4000/cats/$id');
      //final json = jsonDecode(response.data.toString());
      //final cats = json.map((e) => Cat.fromJson(e)).toList();
      //List<Cat> output = (json.decode(response.data) as List).cast()
      emit(GetCatSuccessState(cat: response.data));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onUploadImageCat(
      OnUploadImageCat event, Emitter<CatsState> emit) async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? _imageFileList;

    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _imageFileList = <XFile>[pickedFile];
        print(_imageFileList[0]!.name);

        final formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(_imageFileList[0].path!,
              filename: _imageFileList[0].name),
        });
        final response =
            await dio.post('$uri:4000/cats/upload', data: formData);
        print(response.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
