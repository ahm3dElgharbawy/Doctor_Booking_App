import 'package:doctor_booking/core/constants/sizes.dart';
import 'package:doctor_booking/core/constants/strings.dart';
import 'package:doctor_booking/core/constants/styles.dart';
import 'package:doctor_booking/features/auth/screens/register/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.registerT,
                style: TextStyles.bold36,
              ),
              AppSizes.smVerticalSpace,
              Text(
                AppStrings.registerSubtitleT,
                style: TextStyles.regular20,
              ),
              //? login form
              AppSizes.mdVerticalSpace,
              const CustomRegisterForm(),
              AppSizes.mdVerticalSpace,
              // don't have an account
              Row(
                children: [
                  Text(
                    AppStrings.alreadyHaveAnAccountT,
                    textAlign: TextAlign.center,
                    style: TextStyles.regular14
                        .copyWith(color: Colors.grey.shade600),
                  ),
                  TextButton(
                      onPressed: () {}, child: Text(AppStrings.signInT))
                ],
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}