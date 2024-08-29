import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<Map<String, String>> notifications = [
    {'date': 'Today', 'id': '001', 'textId': 'Vaccination'},
    {'date': 'Jul 24, 2024', 'id': '002', 'textId': 'Artificial Insemination'},
    {'date': 'Jul 23, 2024', 'id': '003', 'textId': 'Farrow'},
  ];

  void _onNotificationTap(String id, String textId) {} //Routing

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 60.h;
    final double containerHeight = notifications.length * itemHeight;

    return Container(
      height: containerHeight,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(), // Dynamically adjusted
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
            child: InkWell(
              onTap: () => _onNotificationTap(
                notification['id']!,
                notification['textId']!,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notification['date']!,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pig ',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: appTertiary),
                            ),
                            TextSpan(
                              text: notification['id'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: appPrimary),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        notification['textId']!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
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
    );
  }
}
