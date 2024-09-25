import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pig_keep/Components/DataTable_PigPen.dart';
import 'package:pig_keep/Components/PigPen_PenNumber.dart';
import 'package:pig_keep/Components/SearchBar_PigPen.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

class PigPen extends StatefulWidget {
  final void Function(Map<String, String>) onRowSelected;

  const PigPen({super.key, required this.onRowSelected});

  @override
  State<PigPen> createState() => _PigPenState();
}

class _PigPenState extends State<PigPen> {
  // controllers
  final TextEditingController _penNumberController = TextEditingController();
  final TextEditingController _penTypeController = TextEditingController();
  final TextEditingController _penMaxNumberController = TextEditingController();

  // pigPen db
  final pigPenService = globalLocator.get<PigPenService>();

  // pig pen variables
  var selectedFarm;
  late String userOwner;
  var pigPens = [];
  String searchValue = '';

  void _navigateToPigPenPenNumber(final rowData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PigPenPenNumber(
          number: rowData.penNumber!,
          type: rowData.penType!,
          pigCount: rowData.currentPigCount!,
          maxPigs: rowData.maxPigCount!,
          pigNumbers: [],
        ),
      ),
    );
  }

  Future<void> addPigPen(int penNumber, String penType, int maxNumber) async {
    print(userOwner);
    // convert penNumber to readable text format
    String penNum = 'P-${penNumber.toString().padLeft(2, '0')}';
    await pigPenService.addPigPen(
        penNum, penType, maxNumber, selectedFarm['_id'], userOwner);
    await getPigPens();
  }

  Future<void> getPigPens() async {
    final fetchPens =
        await pigPenService.fetchPigPens(selectedFarm['_id'], userOwner);
    setState(() {
      pigPens = fetchPens;
    });
  }

  void onSearch(final value) {
    setState(() {
      searchValue = value;
    });
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      selectedFarm = context.read<GlobalProvider>().getSelectedFarm();
      userOwner = user['username'];
      getPigPens();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final farm = context.watch<GlobalProvider>().getSelectedFarm();
    setState(() {
      selectedFarm = farm;
    });
    getPigPens();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // Green box
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Container(
                height: 95.h,
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  border: Border.all(color: appPrimary),
                  color: appPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          pigPens.length.toString(),
                          style: TextStyle(
                            color: appSecondary,
                            fontSize: 70.sp,
                            fontWeight: FontWeight.bold,
                            height: 0.9.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 9.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total \nPig Pens',
                          style: TextStyle(
                            color: appSecondary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 36.h,
                          width: 93.w,
                          padding: EdgeInsets.only(left: 9.w, right: 9.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: appPrimary),
                            color: appSecondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ReusableDialogBox(
                                    title: 'Add Pigpen',
                                    description:
                                        'Fill up the necessary information.',
                                    formFields: [
                                      RecyclableTextFormField(
                                        controller: _penNumberController,
                                        labelText: 'Pen Number',
                                        hintText: 'Pen Number',
                                        hintTextSize: 14.sp,
                                        keyboardType: TextInputType.phone,
                                        icon: Icons.numbers_rounded,
                                        textSize: 14.sp,
                                        height: 43.h,
                                      ),
                                      RecyclableTextFormField(
                                        readOnly: true,
                                        controller: _penTypeController,
                                        labelText: 'Pen Type',
                                        showDropdown: true,
                                        dropdownItems: const [
                                          'Stall',
                                          'Nursery',
                                          'Farrowing',
                                          'Fattening'
                                        ],
                                        hintText: 'Select Pen Type',
                                        hintTextSize: 14.sp,
                                        icon: Icons.house_siding_rounded,
                                        textSize: 14.sp,
                                        height: 43.h,
                                      ),
                                      RecyclableTextFormField(
                                        controller: _penMaxNumberController,
                                        labelText: 'Max Pig Count',
                                        hintText: 'Max Pig Count',
                                        hintTextSize: 14.sp,
                                        keyboardType: TextInputType.phone,
                                        icon: Icons.exposure,
                                        textSize: 14.sp,
                                        height: 43.h,
                                      ),
                                    ],
                                    onSave: () async {
                                      // Handle the save action, e.g., validate and save data
                                      print('Form saved');
                                      await addPigPen(
                                          int.parse(_penNumberController.text),
                                          _penTypeController.text,
                                          int.parse(
                                              _penMaxNumberController.text));
                                      Navigator.of(context).pop();
                                    },
                                    saveButtonText: 'Add Pen',
                                    saveButtonColor: appPrimary,
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle_rounded,
                                  color: appTertiary,
                                  size: 20.h,
                                ),
                                SizedBox(width: 2.h),
                                Text(
                                  'Add Pen',
                                  style: TextStyle(
                                    color: appTertiary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
        SizedBox(height: 11.h),
        Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: SearchBarPigPen(
            onSearchValueChange: onSearch,
          ), // SearchBar_PigPen.dart
        ),
        SizedBox(height: 10.h),
        Container(
          // changable to PigPen
          child: Column(
            children: [
              MyDataTable_Pigpen(
                pigPens: pigPens
                    .where((pen) => pen.penNumber
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()))
                    .toList(),
                onRowSelected: _navigateToPigPenPenNumber,
              )
            ],
          ),
        ),
      ],
    );
  }
}
