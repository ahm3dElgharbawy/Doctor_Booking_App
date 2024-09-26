import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.height,
    this.icon,
    this.shape,
    this.margin,
    this.textColor,
    this.outlineColor, this.backgroundColor,
  });
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final String? icon;
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Color? outlineColor;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 45.h,
      margin: margin,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
          side: BorderSide(color: outlineColor ?? AppColors.softGrey),
        ),

        child: Text(
          title,
          style: TextStyles.medium16
              .copyWith(color: textColor),
          textAlign: icon == null ? TextAlign.center : null,
        ),
      ),
    );
  }
}
