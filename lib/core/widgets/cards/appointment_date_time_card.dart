import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class CustomAppointmentDateAndTime extends StatelessWidget {
  const CustomAppointmentDateAndTime(
      {super.key,
      required this.date,
      required this.time,
      this.color = AppColors.light,
      this.foregroundColor = Colors.black});
  final String date;
  final String time;
  final Color color;
  final Color foregroundColor;
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      color: color,
      padding: EdgeInsets.all(15.r),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.calendar_2,
                  size: 16.r,
                  color: foregroundColor,
                ),
                SizedBox(width: AppSizes.spaceBtwItems.w / 2),
                Text(
                  "${DateFormat.EEEE().format(DateTime.timestamp())}, ${DateFormat.yMMM().format(DateTime.now())}",
                  style: TextStyles.regular12.copyWith(color: foregroundColor),
                ),
              ],
            ),
            AppSizes.smWidth,
            Row(
              children: [
                Icon(
                  Iconsax.clock,
                  size: 16.r,
                  color: foregroundColor,
                ),
                SizedBox(width: AppSizes.spaceBtwItems.w / 2),
                Text(
                  time,
                  style: TextStyles.regular12.copyWith(color: foregroundColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
