import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.radius = 10,
    this.color = AppColors.light,
    this.margin,
    this.onTap,
    this.padding, this.shadow,
  });

  final Widget? child;
  final double radius;
  final Color color;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final BoxShadow? shadow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        height: height,
        width: width,
        margin: margin,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius.r),
          boxShadow: shadow != null ?[shadow!] : null
        ),
        child: child,
      ),
    );
  }
}
