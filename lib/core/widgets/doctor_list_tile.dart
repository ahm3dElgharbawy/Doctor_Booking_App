import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/circular_image.dart';
import 'package:flutter/material.dart';

class DoctorListTileWithLeadingAvatar extends StatelessWidget {
  const DoctorListTileWithLeadingAvatar({
    super.key,
    required this.name,
    required this.avatar,
    required this.category,
    this.foregroundColor = Colors.black,
  });
  final String name;
  final String avatar;
  final String category;
  final Color foregroundColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircularImage(
          image: avatar,
          size: 50.r,
          border: Border.all(color: Colors.grey[200]!),
        ),
        SizedBox(width: AppSizes.spaceBtwItems.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyles.semibold14.copyWith(color: foregroundColor),
            ),
            SizedBox(height: AppSizes.sm.h / 2),
            Text(
              category,
              style: TextStyles.regular12
                  .copyWith(color: foregroundColor.withOpacity(.5)),
            ),
          ],
        ),
      ],
    );
  }
}
