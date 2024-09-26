import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/circular_container.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class CustomCategoryChip extends StatelessWidget {
  const CustomCategoryChip({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });
  final String title;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: AppSizes.md.w),
      child: Column(
        children: [
          CustomCircularContainer(
            padding: EdgeInsets.all(20.r),
            child: Image.asset(
              image,
              height: 30.r,
              width: 30.r,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems / 2),
          Text(
            title,
            style: TextStyles.regular14.copyWith(color: AppColors.darkThree),
          ),
        ],
      ),
    );
  }
}
