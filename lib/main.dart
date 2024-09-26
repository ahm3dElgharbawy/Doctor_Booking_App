import 'package:device_preview/device_preview.dart';
import 'package:doctor_booking/core/services/custom_bloc_observer.dart';
import 'package:doctor_booking/core/utils/helpers/cache_helper.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_provider.dart';
import 'package:doctor_booking/core/utils/themes/app_themes.dart';
import 'package:doctor_booking/features/auth/data/repos/auth_repo.dart';
import 'package:doctor_booking/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:doctor_booking/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_booking/features/auth/presentation/screens/register_screen.dart';
import 'package:doctor_booking/features/home/presentation/logic/home/home_cubit.dart';
import 'package:doctor_booking/features/bookings/presentation/screens/bookings_screen.dart';
import 'package:doctor_booking/features/home/presentation/screens/appointment_screen.dart';
import 'package:doctor_booking/features/home/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_booking/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_booking/features/home/presentation/screens/success_booking_screen.dart';
import 'package:doctor_booking/features/home/data/repos/home_repo.dart';
import 'package:doctor_booking/features/intro/screens/onboarding/onboarding_screen.dart';
import 'package:doctor_booking/features/intro/screens/splash/splash_screen.dart';
import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/features/layout/screens/logic/layout_cubit/layout_cubit.dart';
import 'package:doctor_booking/features/layout/screens/main_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = CustomBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
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
      child: MultiBlocProvider(
        providers: [
          // add your bloc providers here
          BlocProvider(create: (context) => LayoutCubit()),
          BlocProvider(create: (context) => AuthCubit(AuthRepoImpl())),
          BlocProvider(create: (context) => HomeCubit(HomeRepoImpl())),
        ],
        child: MaterialApp(
          title: 'Doc Booking',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          initialRoute: AppRoutes.layout,
          routes: {
            // AppRoutes.start : (context) => const LoginScreen(),
            AppRoutes.start: (context) => const LoginScreen(),
            AppRoutes.splash: (context) => const SplashScreen(),
            AppRoutes.layout: (context) => const MainLayout(),
            AppRoutes.onboarding: (context) => const OnboardingScreen(),
            AppRoutes.login: (context) => const LoginScreen(),
            AppRoutes.register: (context) => const RegisterScreen(),
            AppRoutes.home: (context) => const HomeScreen(),
            AppRoutes.bookings: (context) => const BookingsScreen(),
            AppRoutes.doctorDetails: (context) => const DoctorDetailsScreen(),
            AppRoutes.appointment: (context) => const AppointmentScreen(),
            AppRoutes.successBooking: (context) => const SuccessBookingScreen(),
          },
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
