import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class CustomDoctorScores extends StatelessWidget {
  const CustomDoctorScores({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRoundedContainer(
          width: 100.w,
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              Text(
                "Patients",
                style: TextStyles.medium12
                    .copyWith(color: AppColors.secondary.withOpacity(.5)),
              ),
              AppSizes.smHeight,
              Text(
                "109",
                style: TextStyles.bold18,
              ),
            ],
          ),
        ),
        CustomRoundedContainer(
          width: 100.w,
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              Text(
                "Experience",
                style: TextStyles.medium12
                    .copyWith(color: AppColors.secondary.withOpacity(.5)),
              ),
              AppSizes.smHeight,
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "10",
                    style: TextStyles.bold18,
                  ),
                  const SizedBox(width: AppSizes.xs),
                  Text(
                    "Years",
                    style: TextStyles.bold12,
                  ),
                ],
              )
            ],
          ),
        ),
        CustomRoundedContainer(
          padding: EdgeInsets.all(15.r),
          width: 100.w,
          child: Column(
            children: [
              Text(
                "Rating",
                style: TextStyles.medium12
                    .copyWith(color: AppColors.secondary.withOpacity(.5)),
              ),
              AppSizes.smHeight,
              Text(
                "4.5",
                style: TextStyles.bold18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
