import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';

class UpcomingEvents extends StatefulWidget {
  final VoidCallback onReturn;

  const UpcomingEvents({super.key, required this.onReturn});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  final List<Map<String, dynamic>> CurrentEvents = [
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

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = CurrentEvents.length * itemHeight;
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: widget.onReturn, // Trigger the return to the original state
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: CurrentEvents.length,
            itemBuilder: (context, index) {
              final event = CurrentEvents[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 21.h),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReusableDialogBox(
                          title: 'Update Event',
                          description: 'Fill up the form to update the event.',
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
                                'Event 1 Link this',
                                'Event 2 Link this',
                                'Event 3 Link this',
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
              );
            },
          ),
        )
      ],
    );
  }
}
