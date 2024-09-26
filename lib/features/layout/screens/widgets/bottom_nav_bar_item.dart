import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.isSelected,
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
  final bool isSelected;
  final String label;
  final Widget icon;
  final Widget activeIcon;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              color: AppColors.primary.withOpacity(.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                activeIcon,
                const SizedBox(
                  width: AppSizes.sm,
                ),
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyles.medium14.copyWith(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          )
        : icon;
  }
}
