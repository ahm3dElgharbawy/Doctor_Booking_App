import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/utils/helpers/validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget with Validator {
  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    this.controller,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.fillColor,
    this.suffix,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
    this.readOnly = false,
    this.contentPadding,
    this.expands = false,
    this.onChanged,
  });
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffix;
  final TextInputType keyboardType;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final bool expands;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: readOnly,
      onChanged: onChanged,
      style: TextStyles.regular14,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Icon(prefixIcon,size: 24.r),
        ),
        suffixIcon: suffix,
        fillColor: fillColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyles.medium14.copyWith(color: Colors.grey),
        contentPadding: contentPadding ?? EdgeInsets.all(AppSizes.md.r),
      ),
      validator: (value) {
        if (keyboardType == TextInputType.emailAddress) {
          return validateEmail(value);
        } else {
          return validateRequiredField(value, label);
        }
      },
    );
  }
}
