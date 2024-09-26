import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/appbar.dart';
import 'package:doctor_booking/features/bookings/presentation/screens/bookings_screen.dart';
import 'package:doctor_booking/features/bookings/presentation/screens/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

class BookingsBody extends StatelessWidget {
  const BookingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppointmentStatus.values.length,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: CustomAppbar(
                leading: SizedBox(),
                title: "Bookings",
              ),
            ),
          ],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(AppSizes.defaultSpace.r),
                child: Container(
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Color(0xffF6F6FA),
                  ),
                  child: TabBar(
                      labelStyle:
                          TextStyles.regular14.copyWith(color: Colors.white),
                      unselectedLabelColor: Colors.grey,
                      indicator: const ShapeDecoration(
                        color: AppColors.primary,
                        shape: StadiumBorder(),
                      ),
                      labelPadding: EdgeInsets.zero,
                      padding: EdgeInsets.all(5.r),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      tabs: [
                        ...AppointmentStatus.values.map(
                          (status) => Tab(
                            text: status.name.asTitle,
                            height: 40.h,
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(AppSizes.defaultSpace.r),
                    child: Column(
                      children: [
                        ...List.generate(
                          10,
                          (i) => Padding(
                            padding: EdgeInsets.only(
                              bottom: AppSizes.spaceBtwItems.h,
                            ),
                            child: AppointmentCard(
                              name: "Dr. Omar",
                              category: "cardiology".asTitle,
                              profileImage: ImagesStrings.doctor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Placeholder(),
                  const Placeholder(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
