import 'package:doctor_booking/core/constants/sizes.dart';
import 'package:doctor_booking/core/constants/strings.dart';
import 'package:doctor_booking/core/widgets/buttons/elevated_button.dart';
import 'package:doctor_booking/core/widgets/text_fields/password_text_field.dart';
import 'package:doctor_booking/core/widgets/text_fields/text_field.dart';
import 'package:flutter/material.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hint: "Name",
            prefix: const Icon(Icons.person),
            controller: emailController,
          ),
          AppSizes.mdVerticalSpace,
          CustomTextField(
            hint: "Email",
            prefix: const Icon(Icons.mail),
            controller: emailController,
          ),
          AppSizes.mdVerticalSpace,
          CustomPasswordTextField(
            hint: "Password",
            controller: passwordController,
          ),
          // AppSizes.mdVerticalSpace,
          //? forgot password
          TextButton(
            // padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
            onPressed: (){},
            child: Text(
              AppStrings.forgotPassword,
            ),
          ),
          AppSizes.smVerticalSpace,

          CustomElevatedButton(
            title: AppStrings.registerT,
            // isLoading: true,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
