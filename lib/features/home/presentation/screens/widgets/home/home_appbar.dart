import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/circular_image.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello,",
              style: TextStyles.regular14.copyWith(color: AppColors.darkThree)),
          SizedBox(height: AppSizes.spaceBtwItems.h /2),
          Text("Hi $userName", style: TextStyles.bold20),
        ],
      ),

      CustomCircularImage(
        size: 40.r,
        image: ImagesStrings.user,
      ),
    ]);
  }
}
