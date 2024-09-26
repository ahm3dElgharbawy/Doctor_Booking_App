part of 'booking_cubit.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class SchedulesLoading extends BookingState {}

final class SchedulesSuccess extends BookingState {}

final class SchedulesFailure extends BookingState {
  final String errMessage;
  SchedulesFailure(this.errMessage);
}

final class SelectDateLoading extends BookingState {}
final class SelectDateSuccess extends BookingState {}


final class AppointmentLoading extends BookingState {}
final class AppointmentSuccess extends BookingState {}

final class AppointmentFailure extends BookingState {
  final String errMessage;
  AppointmentFailure(this.errMessage);
}

