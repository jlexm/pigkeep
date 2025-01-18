import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Models/pig-event.dart';
import 'package:pig_keep/Services/pig-helper.dart';

class EventsHistory extends StatefulWidget {
  final VoidCallback onReturn;
  final List<PigEvent> events;

  const EventsHistory(
      {super.key, required this.onReturn, required this.events});

  @override
  State<EventsHistory> createState() => _EventsHistoryState();
}

class _EventsHistoryState extends State<EventsHistory> {
  void _onNotificationTap(String id, String event) {
    // Implement routing logic here
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = widget.events.length * itemHeight;

    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            SizedBox(width: 15.w),
            InkWell(
              onTap: widget.onReturn,
              child: Row(
                children: [
                  Icon(Icons.chevron_left, color: appPrimary),
                  SizedBox(width: 4.w),
                  Text(
                    "Return",
                    style: TextStyle(
                      color: appPrimary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 11.h),
        Row(
          children: [
            SizedBox(width: 20.w),
            Text(
              "Events History",
              style: TextStyle(
                fontSize: 16.sp,
                color: appTertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 13.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: containerHeight,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.events.length,
            itemBuilder: (context, index) {
              final event = widget.events[index];
              String eventStatus = 'Done';

              return Padding(
                padding: EdgeInsets.only(bottom: 21.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: appSecondary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Pig ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: event.pigNumber,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: appPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            event.eventType,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            PigHelper.formatDate(event.eventDate),
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            eventStatus,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: eventStatus == 'Done'
                                  ? appPrimary
                                  : appTertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
