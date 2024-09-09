import 'package:doctor_booking/core/constants/images_strings.dart';
import 'package:doctor_booking/core/constants/sizes.dart';
import 'package:doctor_booking/core/constants/strings.dart';
import 'package:doctor_booking/core/constants/styles.dart';
import 'package:doctor_booking/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class CustomLoginWithSocialButtons extends StatelessWidget {
  const CustomLoginWithSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.socialLogin,
          textAlign: TextAlign.center,
          style: TextStyles.regular14.copyWith(color: Colors.grey.shade600),
        ),
        AppSizes.smVerticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(ImagesStrings.google, height: 35.h),
            ),
            AppSizes.mdHorizontalSpace,
            IconButton(
              onPressed: () {},
              icon: Image.asset(ImagesStrings.facebook, height: 35.h),
            ),
          ],
        ),
      ],
    );
  }
}
