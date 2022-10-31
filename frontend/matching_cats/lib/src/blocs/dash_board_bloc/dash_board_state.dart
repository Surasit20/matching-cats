part of 'dash_board_bloc.dart';

@immutable
abstract class DashBoardState {}

class DashBoardInitial extends DashBoardState {}

class DashboardNav extends DashBoardState {}

class DashboardLoading extends DashBoardState {}
