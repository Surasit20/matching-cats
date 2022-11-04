part of 'cats_bloc.dart';

@immutable
abstract class CatsState {}

class CatsInitial extends CatsState {}

class GetOwnerCatSuccessState extends CatsState {
  List<dynamic> cats;
  GetOwnerCatSuccessState({required this.cats});
}

class GetCatSuccessState extends CatsState {
  dynamic catsAll;
  GetCatSuccessState({required this.catsAll});
}
