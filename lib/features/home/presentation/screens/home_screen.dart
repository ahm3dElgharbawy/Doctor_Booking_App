import 'package:doctor_booking/core/utils/constants/images_strings.dart';
import 'package:doctor_booking/core/utils/constants/routes.dart';
import 'package:doctor_booking/core/utils/constants/sizes.dart';
import 'package:doctor_booking/core/utils/constants/strings.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/extensions/string.dart';
import 'package:doctor_booking/core/utils/helpers/cache_helper.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/shimmer.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/home/appointment_today_card.dart';
import 'package:doctor_booking/core/widgets/section_title.dart';
import 'package:doctor_booking/core/widgets/text_fields/text_field.dart';
import 'package:doctor_booking/features/auth/data/models/user.dart';
import 'package:doctor_booking/features/home/data/models/home.dart';
import 'package:doctor_booking/features/home/presentation/logic/home/home_cubit.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/home/category_chip.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/home/doctor_card.dart';
import 'package:doctor_booking/features/home/presentation/screens/widgets/home/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    UserModel user =
        userModelFromJson(CacheHelper.getString(AppStrings.kUser)!);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.defaultSpace.r),
          child: Column(
            children: [
              //? App bar
              CustomHomeAppBar(userName: user.name),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeFailure) {
                    state.errMessage.showAsToast(color: Colors.red);
                  }
                },
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    HomeModel homeModel = context.read<HomeCubit>().homeData;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? Categories
                        AppSizes.lgHeight,

                        const CustomTextField(
                          prefixIcon: Iconsax.search_normal,
                          hint: "Search a doctor",
                        ),
                        CustomSectionTitle(title: AppStrings.categories),
                        SizedBox(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                homeModel.categories.length,
                                (i) => CustomCategoryChip(
                                  title: homeModel.categories[i].name.asTitle,
                                  image: [
                                    ImagesStrings.cardiology,
                                    ImagesStrings.radiology
                                  ].elementAt(i),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppSizes.mdHeight,
                        //? today appointments
                        CustomSectionTitle(
                          title: "Appointment Today",
                          onTapMore: () {},
                        ),
                        AppointmentTodayCard(
                          name: "Dr. Ahmed El-Sayed",
                          category: "radiology",
                          profileImage: ImagesStrings.doctor,
                          onTap: () {},
                        ),
                        AppSizes.mdHeight,
                        // if (homeModel.todayAppointments.isNotEmpty)
                        //   Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       const CustomSectionTitle(
                        //           title: "Appointment Today"),
                        //       AppSizes.smHeight,
                        //       CustomAppointmentCard(
                        //         appointment: homeModel.todayAppointments[0],
                        //       ),
                        //       AppSizes.smHeight,
                        //     ],
                        //   ),
                        // ShimmerEffect(width: double.infinity, height: 100, borderRadius: BorderRadius.circular(20)),
                        //? top doctors
                        const CustomSectionTitle(title: "Top Doctors"),
                        ...homeModel.topDoctors.map(
                          (doctorModel) => CustomDoctorCard(
                            doctor: doctorModel,
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.doctorDetails,
                                doctorModel,
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
