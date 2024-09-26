import 'package:doctor_booking/features/home/data/models/time.dart';

class ScheduleModel {
  final int id;
  final int doctorId;
  final DateTime date;
  final List<Time>? times;
  ScheduleModel(
      {required this.id,
      required this.doctorId,
      required this.date,
      required this.times});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
      id: json["id"],
      doctorId: json["doctor_id"],
      date: DateTime.parse(json["date"]),
      times: json['time_slots'] == null
          ? null
          : List<Time>.from(json["time_slots"].map((x) => Time.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_slots" : times == null ? null : List<dynamic>.from(times!.map((x) => x.toJson()))
      };
}
