part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailure extends HomeState {
  final String errMessage;
  HomeFailure(this.errMessage);
}