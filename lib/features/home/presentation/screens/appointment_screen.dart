import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/widgets/appbar.dart';
import 'package:doctor_booking/core/widgets/buttons/elevated_button.dart';
import 'package:doctor_booking/features/home/data/repos/booking_repo.dart';
import 'package:doctor_booking/features/home/presentation/logic/booking/booking_cubit.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/appointment/appointment_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _DoctorBookingScreenState();
}

class _DoctorBookingScreenState extends State<AppointmentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final doctorId =
        (ModalRoute.of(context)!.settings.arguments as Map)['doctor_id'];

    return BlocProvider(
      create: (context) =>
          BookingCubit(BookingRepoImpl())..getDoctorSchedules(doctorId),
      child: Scaffold(
        appBar: const CustomAppbar(title: "Appointment"),
        body: const AppointmentScreenBody(),
        bottomNavigationBar: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            final cubit = context.read<BookingCubit>();
            return cubit.times.isEmpty
                ? const SizedBox()
                : CustomElevatedButton(
                    title: "Make Appointment",
                    onTap: () {
                      if (cubit.selectedTimeId == null) {
                        "you must select time".showAsToast(color: Colors.red);
                      } else {
                        cubit.makeAppointment(doctorId);
                      }
                    },
                    isLoading: state is AppointmentLoading ? true : false,
                    margin: const EdgeInsets.all(AppSizes.defaultSpace),
                  );
          },
        ),
      ),
    );
  }
}
