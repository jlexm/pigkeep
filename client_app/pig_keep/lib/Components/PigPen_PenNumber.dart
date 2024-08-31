import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/CenterReusableDialogBox.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';

class PigPenPenNumber extends StatelessWidget {
  final String number;
  final String type;
  final String pigCount;
  final String maxPigs;
  final List<String> pigNumbers;

  const PigPenPenNumber({
    Key? key,
    required this.number,
    required this.type,
    required this.pigCount,
    required this.maxPigs,
    required this.pigNumbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the number of rows needed
    int itemsPerRow = 3;
    int numRows = (pigNumbers.length / itemsPerRow).ceil();

    List<List<String>> rows = List.generate(numRows, (index) {
      return pigNumbers.skip(index * itemsPerRow).take(itemsPerRow).toList();
    });

    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 85.sp,
                        fontWeight: FontWeight.w700,
                        height: 0.9.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      "Pen Number",
                      style: TextStyle(color: appPrimary, fontSize: 16.sp),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30.w),
        Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Pigpen Information",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Container(
                    height: 5.h,
                    width: 157.w,
                    decoration: BoxDecoration(color: appPrimary),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text("Type:  "),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: appPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text("Pig Count:  "),
                  Text(
                    pigCount,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: appPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text("Max Pigs:  "),
                  Text(
                    maxPigs,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: appPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    'Pigs',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: appPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Pigs List Matrix
              Column(
                children: rows.map((row) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: row.map((pig) {
                      return Container(
                        width: 50.w,
                        padding: EdgeInsets.only(
                          left: 3.w,
                          bottom: 15.h,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: appBlue,
                              size: 15.h,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              pig,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 32.h,
                width: 72.w,
                decoration: BoxDecoration(
                    border: Border.all(color: appTertiary, width: 1.5),
                    color: appSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Return",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: appTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ReusableDialogBox(
                      title: 'Edit Pigpen',
                      description: 'Fill up the necessary information.',
                      formFields: [
                        RecyclableTextFormField(
                          controller: TextEditingController(),
                          labelText: 'Pen Type',
                          showDropdown: true,
                          dropdownItems: ['Stall', 'Nursery', 'Farrowing'],
                          hintText: 'Pen Type',
                          hintTextSize: 14.sp,
                          icon: Icons.email,
                          textSize: 14.sp,
                          height: 43.h,
                        ),
                        RecyclableTextFormField(
                          controller: TextEditingController(),
                          labelText: 'Max Number',
                          hintText: 'Max Number',
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
                height: 32.h,
                width: 72.w,
                decoration: BoxDecoration(
                    border: Border.all(color: appBlue, width: 1.5),
                    color: appSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: appBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CenterReusableDialogBox(
                      title: 'Delete Pigpen',
                      description: 'Confirm to delete pigpen.',
                      onSave: () {
                        // Define what should happen when the save button is pressed
                        Navigator.of(context).pop();
                      },
                      saveButtonText: 'Delete',
                      saveButtonColor: appRed,
                    );
                  },
                );
              },
              child: Container(
                height: 32.h,
                width: 72.w,
                decoration: BoxDecoration(
                    border: Border.all(color: appRed, width: 1.5),
                    color: appSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: appRed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ],
    );
  }
}
