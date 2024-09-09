import 'package:doctor_booking/core/constants/colors.dart';
import 'package:doctor_booking/core/constants/images_strings.dart';
import 'package:doctor_booking/core/constants/sizes.dart';
import 'package:doctor_booking/core/constants/strings.dart';
import 'package:doctor_booking/core/constants/styles.dart';
import 'package:doctor_booking/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/features/auth/screens/login/widgets/login_form.dart';
import 'package:doctor_booking/features/auth/screens/login/widgets/login_with_social.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                AppStrings.welcomeT,
                style: TextStyles.bold36,
              ),
              AppSizes.smVerticalSpace,
              Text(
                AppStrings.signInToYourAccountT,
                style: TextStyles.regular20,
              ),
              //? login form
              AppSizes.mdVerticalSpace,
              const CustomLoginForm(),
              AppSizes.mdVerticalSpace,
              //? or login with social media
              const CustomLoginWithSocialButtons(),
              AppSizes.lgVerticalSpace,
              // don't have an account
              Row(
                children: [
                  Text(
                    AppStrings.doNotHavAccount,
                    textAlign: TextAlign.center,
                    style: TextStyles.regular14
                        .copyWith(color: Colors.grey.shade600),
                  ),
                  TextButton(onPressed: (){
                    
                  }, child: Text(AppStrings.registerT))
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
