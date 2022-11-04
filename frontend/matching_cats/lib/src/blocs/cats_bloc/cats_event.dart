part of 'cats_bloc.dart';

@immutable
abstract class CatsEvent {}

class OnAddCat extends CatsEvent {
  final String name;
  final String owner;
  final String breed;
  final String color;
  final String sex;
  final String age;
  final String vaccine;
  final String congenitalDisease;
  final String natureOfParenting;
  OnAddCat({
    required this.name,
    required this.owner,
    required this.breed,
    required this.color,
    required this.sex,
    required this.age,
    required this.vaccine,
    required this.natureOfParenting,
    required this.congenitalDisease,
  });
}

class OnGetOwnerCat extends CatsEvent {}

class OnGetCat extends CatsEvent {}
