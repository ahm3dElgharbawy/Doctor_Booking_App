import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/appbar.dart';
import 'package:doctor_booking/core/widgets/buttons/elevated_button.dart';
import 'package:doctor_booking/features/home/data/models/doctor.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/doctor_details/doctor_details_body.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as DoctorModel;
    bool isFavorite = false;
    return Scaffold(
      appBar: CustomAppbar(
        title: "Doctor Details",
        actions: [
          StatefulBuilder(
            builder: (context, setState) => IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite
                  ? Icon(
                      Iconsax.heart5,
                      size: 24.r,
                      color: AppColors.red,
                    )
                  : Icon(
                      Iconsax.heart,
                      color: Colors.grey,
                      size: 24.r,
                    ),
            ),
          )
        ],
      ),
      body: DoctorDetailsBody(doctor: doctor),
      bottomNavigationBar: CustomElevatedButton(
        margin: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace.r, vertical: AppSizes.defaultSpace.r / 2),
        onTap: () {
          context.pushNamed(AppRoutes.appointment, {'doctor_id': doctor.id});
        },
        title: "Book Appointment",
      ),
    );
  }
}
