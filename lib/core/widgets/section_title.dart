import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({super.key, required this.title, this.onTapMore});
  final String title;
  final VoidCallback? onTapMore;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.semibold16.copyWith(
              color: AppColors.secondary,
              // color: Color(0xff000049)
            ),
          ),
          Visibility(
            visible: onTapMore != null,
            child: TextButton(
              onPressed: onTapMore,
              child:  Text("See All",style: TextStyles.semibold14.copyWith(color: AppColors.orange),),
            ),
          )
        ],
      ),
    );
  }
}
