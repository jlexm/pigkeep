import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Carousel_PigCount.dart';
import 'package:pig_keep/Components/Chip.dart';
import 'package:pig_keep/Components/DataTable.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/FeedInventory.dart';
import 'package:pig_keep/Components/MedicalRecords.dart';
import 'package:pig_keep/Components/PigList.dart';
import 'package:pig_keep/Components/PigPen.dart';
import 'package:pig_keep/Components/PigPen_PenNumber.dart';
import 'package:pig_keep/Components/QRCodeStatus.dart';
import 'package:pig_keep/Components/SearchBar_PigList.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/Notifications.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  int? _selectedChoiceIndex = 0;

  void _onChipSelected(int? index) {
    setState(() {
      _selectedChoiceIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      drawer: Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            // Scroll starts here
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        FarmName(), //FarmName.dart
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 20.w),
                          Text(
                            'Update your pig farm records to keep you on \ntrack with your pig farm management experience.',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 15.w),
                          Chips(onChipSelected: _onChipSelected), 
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    //Display the pages
                    if (_selectedChoiceIndex == 0) QRCodeStatus(),//PigList(), // PigList.dart
                    if (_selectedChoiceIndex == 1) FeedInventory(), // FeedInventory.dart
                    if (_selectedChoiceIndex == 2) MedicalRecords(), // MedicalRecords.dart
                    if (_selectedChoiceIndex == 3) PigPen(), // PigPen.dart
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
