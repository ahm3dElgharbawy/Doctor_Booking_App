import 'package:doctor_booking/core/constants/colors.dart';
import 'package:doctor_booking/core/constants/styles.dart';
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
    this.outlineColor,
  });
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final String? icon;
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Color? outlineColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 50,
      margin: margin,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
          side: BorderSide(color: outlineColor ?? AppColors.secondary),
        ),
        child: Text(
          title,
          style: TextStyles.medium16
              .copyWith(color: textColor ?? AppColors.secondary),
          textAlign: icon == null ? TextAlign.center : null,
        ),
      ),
    );
  }
}
