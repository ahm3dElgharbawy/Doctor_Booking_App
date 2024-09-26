import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/widgets/cards/appointment_date_time_card.dart';
import 'package:doctor_booking/core/widgets/cards/card_with_shadow.dart';
import 'package:doctor_booking/core/widgets/doctor_list_tile.dart';
import 'package:flutter/material.dart';

class AppointmentTodayCard extends StatelessWidget {
  const AppointmentTodayCard({
    super.key,
    required this.name,
    required this.category,
    required this.profileImage,
    this.onTap,
  });
  final String name;
  final String category;
  final String profileImage;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomCardWithShadow(
      color: AppColors.primary,
      child: Column(
        children: [
          DoctorListTileWithLeadingAvatar(
            name: name.asTitle,
            avatar: profileImage,
            category: category.asTitle,
            foregroundColor: Colors.white,
          ),
          AppSizes.smHeight,
          CustomAppointmentDateAndTime(
            date: "2024-10-01",
            time: "11:00 - 12:00 AM",
            color: Colors.white.withOpacity(.3),
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
