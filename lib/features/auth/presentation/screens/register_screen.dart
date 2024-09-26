import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/strings.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/features/auth/presentation/screens/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.defaultSpace.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.registerT,
                style: TextStyles.bold36,
              ),
              AppSizes.smHeight,
              Text(
                AppStrings.registerSubtitleT,
                style: TextStyles.regular20,
              ),
              //? login form
              AppSizes.mdHeight,
              const CustomRegisterForm(),
              AppSizes.mdHeight,
              // don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAnAccountT,
                    textAlign: TextAlign.center,
                    style: TextStyles.regular14
                        .copyWith(color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(AppRoutes.login);
                    },
                    child:
                        Text(AppStrings.signInT, style: TextStyles.regular14),
                  )
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
