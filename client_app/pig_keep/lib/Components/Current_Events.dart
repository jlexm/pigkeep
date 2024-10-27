import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/CenterReusableDialogBox.dart';

class CurrentEvents extends StatefulWidget {
  const CurrentEvents({super.key});

  @override
  State<CurrentEvents> createState() => _CurrentEventsState();
}

class _CurrentEventsState extends State<CurrentEvents> {
  final List<Map<String, dynamic>> currentEvents = [
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

  void _confirmDeletion(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete this event?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  currentEvents.removeAt(index);
                });
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = currentEvents.length * itemHeight;

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: containerHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: currentEvents.length,
        itemBuilder: (context, index) {
          final event = currentEvents[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 21.h),
            child: Dismissible(
              key: Key(event['id']),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: appRed,
                child: Icon(
                  Icons.delete,
                  color: appSecondary,
                ),
              ),
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      title: Text(
                        "Confirm Deletion",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          color: appTertiary,
                        ),
                      ),
                      content: Text(
                        "Are you sure you want to delete this event?",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: appTertiary,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appRed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: appSecondary,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                setState(() {
                  currentEvents.removeAt(index);
                });
              },
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CenterReusableDialogBox(
                        title: 'Accomplished?',
                        description:
                            'Verify if the event has been accomplished by clicking the button.',
                        onSave: () {
                          Navigator.of(context).pop();
                        },
                        saveButtonText: 'Mark as Done',
                        saveButtonColor: appPrimary,
                      );
                    },
                  );
                },
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
                      SizedBox(
                        height: 3.h,
                      ),
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
            ),
          );
        },
      ),
    );
  }
}
