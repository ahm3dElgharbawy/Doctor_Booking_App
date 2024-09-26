import 'package:doctor_booking/features/home/data/models/appointment.dart';
import 'package:doctor_booking/features/home/data/models/category.dart';
import 'package:doctor_booking/features/home/data/models/doctor.dart';

class HomeModel {
    final List<CategoryModel> categories;
    final List<AppointmentModel> todayAppointments;
    final List<DoctorModel> topDoctors;

    HomeModel({
        required this.categories,
        required this.todayAppointments,
        required this.topDoctors,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        categories: List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
        todayAppointments: List<AppointmentModel>.from(json["today_appointments"].map((x) => AppointmentModel.fromJson(x))),
        topDoctors: List<DoctorModel>.from(json["top_doctors"].map((x) => DoctorModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "today_appointments": List<dynamic>.from(todayAppointments.map((x) => x.toJson())),
        "top_doctors": List<dynamic>.from(topDoctors.map((x) => x.toJson())),
    };
}






