import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/pig-event.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/Services/toast-service.dart';

class UpcomingEvents extends StatefulWidget {
  final VoidCallback onReturn;
  final List<PigEvent> events;
  final Future<void> Function(String, DateTime, String, String)? updatePigEvent;
  final void Function(String)? markAsDelete;
  final List<Map<String, dynamic>>? pigs;

  const UpcomingEvents(
      {super.key,
      required this.onReturn,
      required this.events,
      this.pigs,
      this.updatePigEvent,
      this.markAsDelete});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _pigUuidController = TextEditingController();
  final TextEditingController _eventTypeController = TextEditingController();

  String? pigUuidHidden;

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
                  //UpcomingEvents.removeAt(index);
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

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _eventDateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = widget.events.length * itemHeight;
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
            itemCount: widget.events.length,
            itemBuilder: (context, index) {
              final event = widget.events[index];
              String eventStatus = 'Upcoming';
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
                    if (widget.markAsDelete != null) {
                      widget.markAsDelete!(event.uuid);
                    }
                    setState(() {
                      widget.events.removeAt(index);
                    });
                  },
                  child: InkWell(
                    onTap: () {
                      _eventDateController.text =
                          event.eventDate.toString().split(' ')[0];
                      _eventTypeController.text = event.eventType;
                      _pigUuidController.text = event.pigUuid;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReusableDialogBox(
                            title: 'Update Event',
                            description:
                                'Fill up the form to update the event.',
                            formFields: [
                              RecyclableTextFormField(
                                controller: _eventDateController,
                                keyboardType: TextInputType.datetime,
                                labelText: 'Set Event',
                                hintText: 'YYYY/MM/DD',
                                hintTextSize: 14.sp,
                                icon: Icons.calendar_month,
                                textSize: 14.sp,
                                onTap: () {
                                  _selectDate();
                                },
                                readOnly: true,
                              ),
                              RecyclableTextFormField(
                                controller: _pigUuidController,
                                labelText: 'Pig Number',
                                hintText: 'Pig Number',
                                showDropdown: true,
                                isHiddenText: true,
                                onChanged: (v) => {pigUuidHidden = v},
                                dropdownItems: widget.pigs == null
                                    ? []
                                    : widget.pigs!
                                        .where(
                                            (pig) => pig['status'] == 'alive')
                                        .map((pig) => CustomDropDownItem(
                                            pig['uuid'],
                                            'Pig: ${pig['pigNumber']} | Pen: ${pig['penNumber']}'))
                                        .toList(),
                                hintTextSize: 14.sp,
                                icon: Icons.savings,
                                textSize: 14.sp,
                              ),
                              RecyclableTextFormField(
                                controller: _eventTypeController,
                                labelText: 'Event',
                                showDropdown: true,
                                dropdownItems: [
                                  CustomDropDownItem(
                                      'Vaccination', 'Vaccination'),
                                  CustomDropDownItem('Farrowing', 'Farrowing'),
                                  CustomDropDownItem('Artificial Insemination',
                                      'Artificial Insemination'),
                                ],
                                hintText: 'Event',
                                hintTextSize: 14.sp,
                                icon: Icons.event_note,
                                textSize: 14.sp,
                                readOnly: true,
                              ),
                            ],
                            onSave: () async {
                              try {
                                widget.updatePigEvent!(
                                    event.uuid,
                                    DateTime.parse(_eventDateController.text),
                                    pigUuidHidden!,
                                    _eventTypeController.text);
                                context.pop();
                                _eventDateController.clear();
                                _eventTypeController.clear();
                                _pigUuidController.clear();
                                pigUuidHidden = null;
                              } catch (err) {
                                ToastService().showErrorToast(err.toString());
                              }
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
                                  color: eventStatus == 'Upcoming'
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
