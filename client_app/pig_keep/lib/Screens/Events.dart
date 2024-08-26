import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:table_calendar/table_calendar.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      drawer: Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        FarmName(), //FarmName.dart
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 20.w),
                          Text(
                            'Set events for your pig farm to be updated \nand notified.',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 11.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Container(
                            height: 95.h,
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: appPrimary),
                              color: appPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 14.h),
                                    Row(
                                      children: [
                                        Text(
                                          'June, 2024',
                                          style: TextStyle(
                                            color: appSecondary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300,
                                            height: 1.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            'Events',
                                            style: TextStyle(
                                                height: 1.0,
                                                color: appSecondary,
                                                fontSize: 50.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 36.h,
                                      width: 68.w,
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 8.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: appPrimary),
                                        color: appSecondary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: appTertiary,
                                              size: 20.h,
                                            ),
                                            SizedBox(width: 3.h),
                                            Text(
                                              'Set',
                                              style: TextStyle(
                                                color: appTertiary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.calendar_month,
                                    size: 45.w,
                                  )),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: TableCalendar(
                              locale: "en_US",
                              rowHeight: 40.h,
                              headerStyle: HeaderStyle(
                                leftChevronIcon: Icon(
                                  Icons.chevron_left,
                                  color: appPrimary,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.chevron_right,
                                  color: appTertiary,
                                ),
                                titleTextStyle: TextStyle(
                                    fontSize: 13.sp, color: appPrimary),
                                formatButtonVisible: false,
                                titleCentered: true,
                              ),
                              daysOfWeekHeight: 30.h,
                              availableGestures: AvailableGestures.all,
                              selectedDayPredicate: (day) =>
                                  isSameDay(day, today),
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2040, 10, 16),
                              onDaySelected: _onDaySelected,
                              focusedDay: today,
                              startingDayOfWeek: StartingDayOfWeek.sunday,
                              calendarStyle: CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                  color: appPrimary,
                                  shape: BoxShape.circle,
                                ),
                                todayTextStyle: TextStyle(color: appTertiary),
                                weekendTextStyle: TextStyle(color: appPrimary),
                                defaultTextStyle: TextStyle(color: appPrimary),
                                selectedTextStyle:
                                    TextStyle(color: appSecondary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
