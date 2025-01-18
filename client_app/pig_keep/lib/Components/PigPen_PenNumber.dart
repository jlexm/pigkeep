import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/CenterReusableDialogBox.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';

class PigPenPenNumber extends StatefulWidget {
  final String penUUID;

  const PigPenPenNumber({super.key, required this.penUUID});

  @override
  State<PigPenPenNumber> createState() => PigPenView();
}

class PigPenView extends State<PigPenPenNumber> {
  // pigPen db
  final pigService = globalLocator.get<PigService>();
  final penService = globalLocator.get<PigPenService>();

  // controllers
  final TextEditingController _penTypeController = TextEditingController();
  final TextEditingController _maxPigNumberController = TextEditingController();

  // vars
  PigPen? penDetails = null;
  List<Pig> pigs = [];

  // functions
  Future<void> getPenDetails() async {
    final pen = await penService.getPigPenDetails(widget.penUUID);
    final fetchPigs = await pigService.fetchPigsInPen(widget.penUUID);
    setState(() {
      penDetails = pen;
      pigs = fetchPigs.where((pig) => pig.status == 'alive').toList();

      // controllers
      _penTypeController.text = pen!.penType;
      _maxPigNumberController.text = pen.maxPigCount.toString();
    });
  }

  void deletePen() {}

  @override
  void initState() {
    getPenDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int itemsPerRow = 3;
    int numRows = (pigs.length / itemsPerRow).ceil();

    List<List<Pig>> rows = List.generate(numRows, (index) {
      return pigs.skip(index * itemsPerRow).take(itemsPerRow).toList();
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
                      penDetails?.penNumber ?? '--',
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
                    "Pig Pen Information",
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
                  const Text("Type:  "),
                  Text(
                    penDetails?.penType ?? '--',
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
                  const Text("Pig Count:  "),
                  Text(
                    penDetails != null ? pigs.length.toString() : '--',
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
                  const Text("Max Pigs:  "),
                  Text(
                    penDetails != null
                        ? penDetails!.maxPigCount.toString()
                        : '--',
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
              Column(
                children: rows.map((row) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: row.map((pig) {
                      return InkWell(
                          onTap: () {
                            context.push('/records/pigs/${pig.uuid}');
                          },
                          child: Container(
                            width: 100.w,
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
                                  pig.pigNumber,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ));
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
                context.pop();
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
            const Spacer(),
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
                          controller: _penTypeController,
                          labelText: 'Select Pen Type',
                          showDropdown: true,
                          dropdownItems: [
                            CustomDropDownItem('Stall', "Stall"),
                            CustomDropDownItem('Nursery', "Nursery"),
                            CustomDropDownItem('Farrowing', "Farrowing"),
                            CustomDropDownItem('Fattening', "Fattening")
                          ],
                          hintText: 'Pen Type',
                          hintTextSize: 14.sp,
                          keyboardType: TextInputType.none,
                          icon: Icons.house_siding_rounded,
                          textSize: 14.sp,
                        ),
                        RecyclableTextFormField(
                          controller: _maxPigNumberController,
                          labelText: 'Max Number',
                          hintText: 'Max Number',
                          hintTextSize: 14.sp,
                          keyboardType: TextInputType.phone,
                          icon: Icons.numbers_rounded,
                          textSize: 14.sp,
                        ),
                      ],
                      onSave: () async {
                        // Handle the save action, e.g., validate and save data
                        print('Form saved');
                        try {
                          await penService.updatePigPenDetails(
                              widget.penUUID,
                              _penTypeController.text,
                              int.parse(_maxPigNumberController.text));
                          await getPenDetails();
                        } catch (err) {
                          ToastService().showErrorToast(err.toString());
                        }
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
                if (!pigs.isEmpty) {
                  ToastService().showErrorToast('Pen must be empty.');
                  return;
                }
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CenterReusableDialogBox(
                      title: 'Delete Pigpen',
                      description: 'Confirm to delete pigpen.',
                      onSave: () {
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
