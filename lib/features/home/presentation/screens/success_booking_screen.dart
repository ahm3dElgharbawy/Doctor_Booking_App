import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';

class SuccessBookingScreen extends StatelessWidget {
  const SuccessBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Icon(
                  Icons.verified,
                  size: 100.h,
                  color: Colors.green,
                ),
              ),
              AppSizes.mdHeight,
              Expanded(
                flex: 1,
                child: Text(
                  "Booking Success",
                  style: TextStyles.regular22,
                ),
              ),
              CustomElevatedButton(
                title: "Back To Home Page",
                onTap: () {
                  context.pushReplacementAllNamed(AppRoutes.layout);
                },
                margin: const EdgeInsets.all(AppSizes.defaultSpace),
              )
            ],
          ),
        ),
      ),
    );
  }
}
