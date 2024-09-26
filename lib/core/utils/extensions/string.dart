import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/main.dart';
import 'package:flutter/material.dart';

extension StringAsToast on String {
  void showAsToast({Color color = AppColors.primary}) {
    final context = MyApp.navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Container(
            decoration:
                ShapeDecoration(shape: const StadiumBorder(), color: color),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              this,
              style: TextStyles.regular14.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        // backgroundColor: color,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.all(AppSizes.defaultSpace),
      ),
    );
  }
}

extension Title on String {
  String get asTitle => split(" ").map((word) => "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}").join(" ");
}
