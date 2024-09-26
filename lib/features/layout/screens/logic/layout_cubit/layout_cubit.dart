import 'package:doctor_booking/features/bookings/presentation/screens/bookings_screen.dart';
import 'package:doctor_booking/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  final List<Widget> screens = [
    const HomeScreen(), // home screen
    const BookingsScreen(), // bookings screen
    Container(), // bookings screen
    Container() // bookings screen
  ];
  final List<Map> navigationItems = [
    {'icon': Icons.chat, 'label': "Chats"},
    {'icon': Icons.tips_and_updates, 'label': "Status"},
    {'icon': Icons.phone, 'label': "Calls"},
  ];

  void changeBottomNavBar(int newIndex) {
    currentIndex = newIndex;
    pageController.jumpToPage(
      newIndex,
    );
    emit(BottomNavigationBarChanged());
  }
}
