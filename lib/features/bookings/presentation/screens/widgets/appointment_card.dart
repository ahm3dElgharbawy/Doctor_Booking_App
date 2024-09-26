import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/buttons/elevated_button.dart';
import 'package:doctor_booking/core/widgets/buttons/outlined_button.dart';
import 'package:doctor_booking/core/widgets/cards/appointment_date_time_card.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:doctor_booking/core/widgets/doctor_list_tile.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
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
    return CustomRoundedContainer(
      color: Colors.white,
      padding:  EdgeInsets.all(15.r),
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: const Offset(0, 4),
        blurRadius: 10,
        spreadRadius: -1,
      ),
      child: Column(
        children: [
          DoctorListTileWithLeadingAvatar(
            name: name,
            avatar: profileImage,
            category: category,
          ),
          AppSizes.smHeight,
          const CustomAppointmentDateAndTime(
            date: "2024-10-01",
            time: "11:00 - 12:00 AM",
          ),
          AppSizes.smHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: CustomOutlinedButton(
                  title: "Cancel",
                  onTap: () {},
                  backgroundColor: AppColors.light,
                  outlineColor: AppColors.light,
                ),
              ),
              AppSizes.smWidth,
              Flexible(
                child: CustomElevatedButton(
                  title: "Reschedule",
                  onTap: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
