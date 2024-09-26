import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/circular_image.dart';
import 'package:doctor_booking/core/widgets/section_title.dart';
import 'package:doctor_booking/features/home/data/models/doctor.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/doctor_details/doctor_scores.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/doctor_details/map_card.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/doctor_details/review_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({
    super.key,
    required this.doctor,
  });

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.defaultSpace.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCircularImage(
              size: 100.r,
              image: ImagesStrings.doctor,
              border: Border.all(color: Colors.grey[100]!),
            ),
            AppSizes.smHeight,
            //? doctor professional experiences
            Text(
              "Dr. Ahmed El-Sayed",
              style: TextStyles.semibold20,
            ),
            Text(
              doctor.details!.category.name.asTitle,
              style: TextStyles.regular14
                  .copyWith(color: AppColors.secondary.withOpacity(.5)),
            ),
            AppSizes.lgHeight,
            //? doctor scores
            const CustomDoctorScores(),
            AppSizes.lgHeight,

            //? about doctor
            const CustomSectionTitle(title: "About Doctor"),
            Text(
              "Experienced doctor dedicated to providing compassionate, patient-centered care with a strong commitment to advancing health and wellness.",
              style: TextStyles.regular14.copyWith(
                color: AppColors.secondary.withOpacity(.5),
                height: 1.5,
              ),
            ),
            AppSizes.smHeight,
            CustomSectionTitle(
              title: "Reviews",
              onTapMore: () {},
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomReviewCard(),
                  CustomReviewCard(),
                ],
              ),
            ),
            const CustomSectionTitle(title: "Location"),
            const CustomMapCard(
              latLong: LatLng(30.04882953998337, 31.2423026285223952),
            )
          ],
        ),
      ),
    );
  }
}
