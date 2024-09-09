import 'package:doctor_booking/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/helpers/responsive_helpers/size_provider.dart';
import 'package:doctor_booking/core/theme/app_themes.dart';
import 'package:doctor_booking/features/auth/screens/login/login_screen.dart';
import 'package:doctor_booking/features/auth/screens/register/register_screen.dart';
import 'package:doctor_booking/features/init/screens/onboarding/onboarding_screen.dart';
import 'package:doctor_booking/features/init/screens/splash/splash_screen.dart';
import 'package:doctor_booking/core/constants/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return SizedProvider(
      designSize: const Size(360, 690),
      height: context.screenHeight,
      width: context.screenWidth,
      child: MaterialApp(
        title: 'Doc Booking',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.light,
        routes: {
          AppRoutes.start : (context) => const LoginScreen(),
          AppRoutes.splash : (context) => const SplashScreen(),
          AppRoutes.onboarding : (context) => const OnboardingScreen(),
          AppRoutes.login : (context) => const LoginScreen(),
          AppRoutes.register : (context) => const RegisterScreen(),
        },
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

