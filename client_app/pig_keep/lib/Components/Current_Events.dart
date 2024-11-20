import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/CenterReusableDialogBox.dart';
import 'package:pig_keep/Models/pig-event.dart';
import 'package:pig_keep/Services/pig-event-service.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';

class CurrentEvents extends StatefulWidget {
  final List<PigEvent> events;
  final Future<void> Function(String)? markAsDone;
  const CurrentEvents({super.key, required this.events, this.markAsDone});

  @override
  State<CurrentEvents> createState() => _CurrentEventsState();
}

class _CurrentEventsState extends State<CurrentEvents> {
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
                  //events.removeAt(index);
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
// services
    final pigEventService = globalLocator.get<PigEventService>();

    final double itemHeight = 80.h;
    final double containerHeight = widget.events.length * itemHeight;

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: containerHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.events.length,
        itemBuilder: (context, index) {
          final event = widget.events[index];
          String eventStatus = (event.eventDate.isBefore(DateTime.now()) ||
                      event.eventDate.isAtSameMomentAs(DateTime.now())) &&
                  event.status == 'Pending'
              ? 'In Progress'
              : event.status!;
          return Padding(
            padding: EdgeInsets.only(bottom: 21.h),
            child: Dismissible(
              key: Key(event.uuid),
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
                  //currentEvents.removeAt(index);
                });
              },
              child: InkWell(
                onTap: () {
                  if (eventStatus != 'In Progress') {
                    return;
                  }
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CenterReusableDialogBox(
                        title: 'Accomplished?',
                        description:
                            'Verify if the event has been accomplished by clicking the button.',
                        onSave: () async {
                          try {
                            await widget.markAsDone!(event.uuid);
                            context.pop();
                          } catch (err) {
                            ToastService().showErrorToast(err.toString());
                          }
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
                                  text: event.pigNumber,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
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
                      SizedBox(
                        height: 3.h,
                      ),
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
                              color: eventStatus == 'In Progress'
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
