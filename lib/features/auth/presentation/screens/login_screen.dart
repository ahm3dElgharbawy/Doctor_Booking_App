import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/strings.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/features/auth/presentation/screens/widgets/login_form.dart';
import 'package:doctor_booking/features/auth/presentation/screens/widgets/login_with_social.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                AppStrings.welcomeT,
                style: TextStyles.bold36,
              ),
              AppSizes.smHeight,
              Text(
                AppStrings.signInToYourAccountT,
                style: TextStyles.regular20,
              ),
              //? login form
              AppSizes.mdHeight,
              const CustomLoginForm(),
              AppSizes.mdHeight,
              //? or login with social media
              const CustomLoginWithSocialButtons(),
              AppSizes.lgHeight,
              // don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.doNotHavAccount,
                    textAlign: TextAlign.center,
                    style: TextStyles.regular14
                        .copyWith(color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(AppRoutes.register);
                    },
                    child: Text(AppStrings.registerT,style: TextStyles.regular14),
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
