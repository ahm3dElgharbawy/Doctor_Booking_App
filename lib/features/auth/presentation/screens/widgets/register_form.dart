import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/strings.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/widgets/buttons/elevated_button.dart';
import 'package:doctor_booking/core/widgets/text_fields/password_text_field.dart';
import 'package:doctor_booking/core/widgets/text_fields/text_field.dart';
import 'package:doctor_booking/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});

  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
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
            hint: "Name",
            label: "Name",
            prefixIcon: Icons.person,
            controller: nameController,
          ),
          AppSizes.mdHeight,
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
          AppSizes.smHeight,
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                context.pushReplacementAllNamed(AppRoutes.login);
              } else if (state is RegisterFailure) {
                state.errMessage.showAsToast(color: Colors.red);
              }
            },
            builder: (context, state) {
              return CustomElevatedButton(
                title: AppStrings.registerT,
                isLoading: state is RegisterLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().register(
                          name: nameController.text,
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
