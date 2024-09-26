import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/circular_image.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * .85,
      child: CustomRoundedContainer(
        margin: EdgeInsetsDirectional.only(end: 10.w),
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCircularImage(
                  image: ImagesStrings.temp,
                  size: 60.r,
                ),
                AppSizes.smWidth,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mahmoud ali",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.semibold16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSizes.sm.r / 2, bottom: AppSizes.sm.r),
                        child: Text(
                          "1 days ago",
                          maxLines: 1,
                          style:
                              TextStyles.regular14.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSizes.smWidth,
                CustomRoundedContainer(
                  radius: 50.r,
                  color: AppColors.orange.withOpacity(.1),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 18.r,
                        color: AppColors.orange,
                      ),
                      Text(" 4", style: TextStyles.regular14),
                    ],
                  ),
                )
              ],
            ),
            AppSizes.smHeight,
             Text(
              "Dr. Ahmed El-Sayed has been an incredible support throughout my health journey! Their expertise and genuine care make such a difference. Highly recommend to anyone looking for a doctor who truly listens and puts patients first!",
              style: TextStyles.regular14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
