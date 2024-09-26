import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/outlined_container.dart';
import 'package:doctor_booking/features/home/presentation/logic/booking/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTimesChips extends StatefulWidget {
  const CustomTimesChips({super.key});

  @override
  State<CustomTimesChips> createState() => _CustomTimesChipsState();
}

class _CustomTimesChipsState extends State<CustomTimesChips> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();
    return GridView.builder(
      itemCount: cubit.times.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      itemBuilder: (context, index) {
        final bool isSelected = cubit.selectedTimeId == cubit.times[index].id;
        return CustomOutlinedContainer(
          padding: const EdgeInsets.all(5),
          color: isSelected
              ? AppColors.primary
              : null,
          onTap: () {
            setState(() {
              cubit.selectedTimeId = cubit.times[index].id;
            });
          },
          child: Text(
            cubit.times[index].startTime,
            style: TextStyles.regular12.copyWith(
              color: isSelected
                  ? Colors.white
                  : null,
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.h,
        childAspectRatio: 1.5,
      ),
    );
  }
}
