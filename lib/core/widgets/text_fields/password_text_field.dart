import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/utils/helpers/validator.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField(
      {super.key,
      this.hint,
      this.controller,
      this.passwordToConfirmController});
  final String? hint;
  final TextEditingController? controller;
  final TextEditingController? passwordToConfirmController;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField>
    with Validator {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isHidden,
      style: TextStyles.regular14,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyles.medium14.copyWith(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 2,
        contentPadding: EdgeInsets.all(AppSizes.md.r),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Icon(
            Icons.lock,
            size: 24.r,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Icon(
              isHidden ? Icons.visibility_off : Icons.visibility,
              color: AppColors.darkThree,
              size: 24.r,
            ),
          ),
        ),
      ),
      validator: (password) {
        if (widget.passwordToConfirmController != null) {
          // for validate password confirmation
          return validateConfirmPassword(
              password, widget.passwordToConfirmController!.text);
        }
        return validatePassword(password);
      },
    );
  }
}
