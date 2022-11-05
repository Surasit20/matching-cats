part of 'cats_bloc.dart';

@immutable
abstract class CatsState {}

class CatsInitial extends CatsState {}

class GetOwnerCatSuccessState extends CatsState {
  List<dynamic> cats;
  GetOwnerCatSuccessState({required this.cats});
}

class GetCatsSuccessState extends CatsState {
  dynamic catsAll;
  GetCatsSuccessState({required this.catsAll});
}

class GetCatSuccessState extends CatsState {
  dynamic cat;
  GetCatSuccessState({required this.cat});
}
