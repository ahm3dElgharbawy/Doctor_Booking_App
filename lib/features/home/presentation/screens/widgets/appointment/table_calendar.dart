import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/features/home/data/models/schedule.dart';
import 'package:doctor_booking/features/home/presentation/logic/booking/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({super.key});

  @override
  State<CustomTableCalendar> createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  CalendarFormat selectedFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();

    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return TableCalendar(
          currentDay: DateTime.now(),
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: focusedDay,
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},
          selectedDayPredicate: (day) {
            // mark the selected date
            return isSameDay(day, cubit.selectedDay);
          },
          onDaySelected: (selectedDay, focusedDay) {
            this.focusedDay = selectedDay;
            cubit.selectAppointmentDate(selectedDay);
          },
          calendarStyle: CalendarStyle(
            selectedDecoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color:
                  AppColors.primary.withOpacity(.5), // Customize today's color
              shape: BoxShape.circle,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, day, events) {
              for (ScheduleModel schedule in cubit.schedules) {
                if (isSameDay(schedule.date, day)) {
                  return GestureDetector(
                    onTap: () {
                      focusedDay = day;
                      cubit.selectAppointmentDate(day);
                    },
                    child: Center(
                      child: Chip(
                        shape: const CircleBorder(),
                        label: Text(
                          day.day.toString(),
                          // style: TextStyles.regular16,
                        ),
                      ),
                    ),
                  );
                }
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
