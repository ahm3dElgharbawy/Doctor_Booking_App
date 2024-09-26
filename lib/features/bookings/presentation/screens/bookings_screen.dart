import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/widgets/appbar.dart';
import 'package:doctor_booking/features/bookings/presentation/screens/widgets/appointment_card.dart';
import 'package:doctor_booking/features/bookings/presentation/screens/widgets/bookings_body.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

enum AppointmentStatus { upcoming, canceled, completed }

class _BookingsScreenState extends State<BookingsScreen> {
  AppointmentStatus status = AppointmentStatus.upcoming;
  List<Map> schedules = [
    {
      "doctor_name": "omar ahmed",
      "category": "Dental",
      "status": AppointmentStatus.completed
    },
    {
      "doctor_name": "mohamed ali",
      "category": "Cardiology",
      "status": AppointmentStatus.upcoming
    },
    {
      "doctor_name": "omar ahmed",
      "category": "Dental",
      "status": AppointmentStatus.upcoming
    },
    {
      "doctor_name": "omar ahmed",
      "category": "Respiration",
      "status": AppointmentStatus.completed
    },
    {
      "doctor_name": "omar ahmed",
      "category": "General",
      "status": AppointmentStatus.canceled
    },
  ];
  Alignment alignment = Alignment.centerLeft;
  @override
  Widget build(BuildContext context) {
    final bookings =
        schedules.where((schedule) => schedule['status'] == status);
    return const Scaffold(
      body: BookingsBody()
    );
  }
}
