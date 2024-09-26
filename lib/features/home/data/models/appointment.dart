import 'package:doctor_booking/features/home/data/models/doctor.dart';
import 'package:doctor_booking/features/home/data/models/schedule.dart';
import 'package:doctor_booking/features/home/data/models/time.dart';

class AppointmentModel {
    final int id;
    final int userId;
    final int doctorId;
    final int scheduleId;
    final int timeId;
    final String status;
    final DoctorModel doctor;
    final ScheduleModel schedule;
    final Time time;

    AppointmentModel({
        required this.id,
        required this.userId,
        required this.doctorId,
        required this.scheduleId,
        required this.timeId,
        required this.status,
        required this.doctor,
        required this.schedule,
        required this.time,
    });

    factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        scheduleId: json["schedule_id"],
        timeId: json["time_id"],
        status: json["status"],
        doctor: DoctorModel.fromJson(json["doctor"]),
        schedule: ScheduleModel.fromJson(json["schedule"]),
        time: Time.fromJson(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "schedule_id": scheduleId,
        "time_id": timeId,
        "status": status,
        "doctor": doctor.toJson(),
        "schedule": schedule.toJson(),
        "time": time.toJson(),
    };
}