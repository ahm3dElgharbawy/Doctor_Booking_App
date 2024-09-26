import 'package:doctor_booking/features/home/data/models/schedule.dart';
import 'package:doctor_booking/features/home/data/models/time.dart';
import 'package:doctor_booking/features/home/data/repos/booking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.bookingRepo) : super(BookingInitial());
  BookingRepo bookingRepo;
  List<ScheduleModel> schedules = [];
  //
  DateTime? selectedDay;
  int? selectedTimeId;
  List<Time> times = [];
  //
  void getDoctorSchedules(int doctorId) {
    emit(SchedulesLoading());
    bookingRepo.getDoctorSchedules(doctorId, (error) {
      emit(SchedulesFailure(error.message));
    }, (data) {
      schedules =
          data.map((schedule) => ScheduleModel.fromJson(schedule)).toList();
      emit(SchedulesSuccess());
    });
  }

  void makeAppointment(int doctorId) {
    emit(AppointmentLoading());
    bookingRepo.makeAppointment(
      {
        'doctor_id': doctorId,
        'time_id': selectedTimeId,
      },
      (error) => emit(AppointmentFailure(error.message)),
      (data) => emit(AppointmentSuccess()),
    );
  }

  void selectAppointmentDate(DateTime date) {
    emit(SelectDateLoading());
    final t = schedules.where((s) => isSameDay(s.date, date)).toList();
    times = t.isEmpty ? [] : t[0].times!;
    selectedDay = date;
    selectedTimeId = null;
    emit(SelectDateSuccess());
  }
}
