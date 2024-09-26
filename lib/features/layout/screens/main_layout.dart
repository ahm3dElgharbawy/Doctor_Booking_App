import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/features/bookings/presentation/screens/bookings_screen.dart';
import 'package:doctor_booking/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_booking/features/layout/screens/logic/layout_cubit/layout_cubit.dart';
import 'package:doctor_booking/features/layout/screens/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  final List<Map> navigationItems = [
    {'icon': Iconsax.home, 'activeIcon': Iconsax.home_15, 'label': "Home"},
    {
      'icon': Iconsax.calendar_2,
      'activeIcon': Iconsax.calendar_25,
      'label': "Bookings"
    },
    {
      'icon': Iconsax.message,
      'activeIcon': Iconsax.message5,
      'label': "Chats",
    },
    {
      'icon': Iconsax.frame_1,
      'activeIcon': Iconsax.frame_1,
      'label': "Profile"
    },
  ];

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    return Scaffold(
      body: PageView(
        controller: cubit.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (newIndex) {
          // setState(() {
          //   currentIndex = newIndex;
          // });
        },
        children: cubit.screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent, // Remove highlight color
        ),
        child: BlocBuilder<LayoutCubit, LayoutState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              onTap: (itemIndex) {
                cubit.changeBottomNavBar(itemIndex);
              },
              items: [
                ...List.generate(
                  navigationItems.length,
                  (i) => BottomNavigationBarItem(
                    icon: CustomBottomNavigationBarItem(
                      isSelected: cubit.currentIndex == i,
                      icon: Icon(
                        navigationItems[i]['icon'],
                        color: AppColors.darkTwo,
                        size: 24.r,
                      ),
                      activeIcon: Icon(
                        navigationItems[i]['activeIcon'],
                        color: AppColors.primary,
                        size: 24.r,
                      ),
                      label: navigationItems[i]['label'],
                    ),
                    label: "",
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
