import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/cards/card_with_shadow.dart';
import 'package:doctor_booking/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';

class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard(
      {super.key, required this.doctor, required this.onTap});
  final DoctorModel doctor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    print("${context.screenHeight}, ${context.screenWidth}");
    return CustomCardWithShadow(
      color: Colors.white,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 80.r,
            height: 80.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey[100]!),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ImagesStrings.doctor,
                ),
              ),
            ),
          ),
          AppSizes.smWidth,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. ${"Ahmed El-Sayed".asTitle}",
                style: TextStyles.semibold14,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppSizes.sm.r / 2, bottom: AppSizes.sm.r),
                child: Text(
                  "cardiology".asTitle,
                  style: TextStyles.regular12
                      .copyWith(color: AppColors.secondary.withOpacity(.5)),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 24.r,
                    color: AppColors.orange,
                  ),
                  Text("4.0 • 50 Reviews",style: TextStyles.regular14,),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
