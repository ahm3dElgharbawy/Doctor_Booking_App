import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:doctor_booking/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';

class CustomTopDoctorCard extends StatelessWidget {
  const CustomTopDoctorCard({super.key, required this.onTap, required this.doctor});
  final VoidCallback onTap;
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      height: 100.h,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            ImagesStrings.temp,
            fit: BoxFit.cover,
            height: 100.h,
            width: 100.w,
          ),
          AppSizes.smWidth,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name, style: TextStyles.regular16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
                  child: Text(doctor.details!.category.name, style: TextStyles.regular14),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text(doctor.details!.rating.toString(), style: TextStyles.regular14),
                    AppSizes.smWidth,
                    Text("Reviews (120)", style: TextStyles.regular14)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
