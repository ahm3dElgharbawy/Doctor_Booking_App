
import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/features/home/presentation/logic/booking/booking_cubit.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/appointment/table_calendar.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/appointment/times_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentScreenBody extends StatelessWidget {
  const AppointmentScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final doctorId = (context.args as Map)['doctor_id'];
    return SafeArea(
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is AppointmentSuccess) {
            context.pushNamed(AppRoutes.successBooking);
          } else if(state is AppointmentFailure){
            state.errMessage.showAsToast(color: Colors.red);
          }
        },
        builder: (context, state) {
          final cubit = context.read<BookingCubit>();
          if (state is SchedulesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomScrollView(
            slivers: [
              // SliverToBoxAdapter(
              //   child: Center(
              //     child: Text(
              //       "Selected Date : ${DateFormat("yyyy-MM-dd").format(cubit.selectedDay ?? DateTime.now())}",
              //     ),
              //   ),
              // ),
              //? table calender
              const SliverToBoxAdapter(child: CustomTableCalendar()),
              if (cubit.times.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.spaceBtwItems),
                    child: Center(
                      child: Text(
                        "Select Consultation Time",
                        style: TextStyles.medium18,
                      ),
                    ),
                  ),
                ),
              //? consultation times
              if (cubit.times.isNotEmpty)
                const SliverToBoxAdapter(child: CustomTimesChips()),
              // if (cubit.times.isNotEmpty)
              //   SliverToBoxAdapter(
              //     child: CustomElevatedButton(
              //       title: "Make Appointment",
              //       onTap: () {
              //         if (cubit.selectedTimeId == null) {
              //           "you must select time".showAsToast(color: Colors.red);
              //         } else{
              //           cubit.makeAppointment(doctorId);
              //         }
              //       },
              //       isLoading: state is AppointmentLoading ? true : false,
              //       margin: const EdgeInsets.symmetric(
              //         horizontal: AppSizes.defaultSpace,
              //         vertical: AppSizes.spaceBtwSections,
              //       ),
              //     ),
              //   )
            ],
          );
        },
      ),
    );
  }
}
