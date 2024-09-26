import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/strings.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/buttons/elevated_button.dart';
import 'package:doctor_booking/core/widgets/text_fields/password_text_field.dart';
import 'package:doctor_booking/core/widgets/text_fields/text_field.dart';
import 'package:doctor_booking/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hint: "Email",
            label: "Email address",
            prefixIcon: Icons.mail,
            controller: emailController,
          ),
          AppSizes.mdHeight,
          CustomPasswordTextField(
            hint: "Password",
            controller: passwordController,
          ),
          SizedBox(height: AppSizes.sm.h / 2,),
          //? forgot password
          TextButton(
            // padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
            onPressed: () {},
            child: Text(
              AppStrings.forgotPassword,
              style: TextStyles.regular14,
            ),
          ),
          AppSizes.smHeight,

          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.pushReplacementAllNamed(AppRoutes.layout);
              } else if (state is LoginFailure) {
                state.errMessage.showAsToast(color: Colors.red);
              }
            },
            builder: (context, state) {
              return CustomElevatedButton(
                title: AppStrings.signInT,
                isLoading: state is LoginLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
