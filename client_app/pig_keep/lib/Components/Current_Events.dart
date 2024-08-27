import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class CurrentEvents extends StatefulWidget {
  const CurrentEvents({super.key});
 
  @override
  State<CurrentEvents> createState() => _CurrentEventsState();
}

class _CurrentEventsState extends State<CurrentEvents> {
  final List<Map<String, dynamic>> CurrentEvents = [
    {
      'date': 'Today',
      'time': '08:00 AM',
      'id': '002', // Pig ID 002
      'event': 'Vaccination',
      'status': 'In Progress',
    },

    {
      'date': 'Jul 24, 2024',
      'time': '09:30 AM',
      'id': '003',
      'event': 'Farrow',
      'status': 'In Progress',
    },
  ];

  void _onNotificationTap(String id, String event) {
    // Routing logic here
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = CurrentEvents.length * itemHeight;

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: containerHeight,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: CurrentEvents.length,
        itemBuilder: (context, index) {
          final event = CurrentEvents[index];

          return Padding(
            padding: EdgeInsets.only(bottom: 21.h),
            child: InkWell(
              onTap: () => _onNotificationTap(
                event['id']!,
                event['event']!,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                                text: event['id'],
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
                          event['event']!,
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
                          event['date']!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          event['status']!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: event['status'] == 'In Progress'
                                ? appPrimary
                                : appTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
