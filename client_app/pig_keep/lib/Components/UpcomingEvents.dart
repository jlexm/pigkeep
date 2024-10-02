import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';

class UpcomingEvents extends StatefulWidget {
  final VoidCallback onReturn;

  const UpcomingEvents({super.key, required this.onReturn});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  final List<Map<String, dynamic>> UpcomingEvents = [
    {
      'date': 'Aug 23, 2024',
      'time': '08:00 AM',
      'id': '002',
      'event': 'Vaccination',
      'status': 'Upcoming',
    },
    {
      'date': 'Aug 23, 2024',
      'time': '09:30 AM',
      'id': '003',
      'event': 'Farrow',
      'status': 'Upcoming',
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
                  UpcomingEvents.removeAt(index);
                });
                Navigator.of(context).pop();
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
    final double containerHeight = UpcomingEvents.length * itemHeight;
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: widget.onReturn,
          child: Row(
            children: [
              SizedBox(
                width: 15.w,
              ),
              Icon(
                Icons.chevron_left,
                color: appPrimary,
              ),
              InkWell(
                child: Text(
                  "Return",
                  style: TextStyle(
                    color: appPrimary,
                    fontSize: 12.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              "Upcoming Events",
              style: TextStyle(
                fontSize: 16.sp,
                color: appTertiary,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          height: containerHeight,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: UpcomingEvents.length,
            itemBuilder: (context, index) {
              final event = UpcomingEvents[index];
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
                      UpcomingEvents.removeAt(index);
                    });
                  },
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReusableDialogBox(
                            title: 'Update Event',
                            description:
                                'Fill up the form to update the event.',
                            formFields: [
                              RecyclableTextFormField(
                                controller: TextEditingController(),
                                labelText: 'Date',
                                hintText: 'Date',
                                hintTextSize: 14.sp,
                                icon: Icons.email,
                                textSize: 14.sp,
                                height: 43.h,
                              ),
                              RecyclableTextFormField(
                                controller: TextEditingController(),
                                labelText: 'Pig Number',
                                hintText: 'Pig Number',
                                hintTextSize: 14.sp,
                                icon: Icons.email,
                                textSize: 14.sp,
                                height: 43.h,
                              ),
                              RecyclableTextFormField(
                                controller: TextEditingController(),
                                labelText: 'Event Name',
                                showDropdown: true,
                                dropdownItems: [
                                  CustomDropDownItem('Event 1', 'Event 1'),
                                ],
                                hintText: 'Event Name',
                                hintTextSize: 14.sp,
                                icon: Icons.email,
                                textSize: 14.sp,
                                height: 43.h,
                              ),
                            ],
                            onSave: () {
                              // Handle the save action, e.g., validate and save data
                              print('Form saved');
                              Navigator.of(context).pop();
                            },
                            saveButtonText: 'Save',
                            saveButtonColor: appBlue,
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
                                  color: event['status'] == 'Upcoming'
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
        )
      ],
    );
  }
}
