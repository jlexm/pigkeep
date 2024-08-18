import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Carousel_PigCount.dart';
import 'package:pig_keep/Components/Chip.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/SearchBar.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/Notifications.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  int? _selectedChoiceIndex;

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        FarmName(), //FarmName.dart
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Check and update your pig farm records to keep you \non track with your pig farm management experience.',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Chips(), //Chip.dart
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 95.h,
                          width: 320.w,
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
                                    '42',
                                    style: TextStyle(
                                      color: appSecondary,
                                      fontSize: 70.sp,
                                      fontWeight: FontWeight.bold,
                                      height: 0.9.h,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total \nLiving Pig',
                                    style: TextStyle(
                                        color: appSecondary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 36.h,
                                    width: 93.w,
                                    padding:
                                        EdgeInsets.only(left: 9.w, right: 9.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: appPrimary),
                                      color: appSecondary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_circle_rounded,
                                            color: appTertiary,
                                            size: 20.h,
                                          ),
                                          SizedBox(width: 3.h),
                                          Text(
                                            'Add Pig',
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
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Row(
                      //QR code & Search
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 34.h,
                              width: 98.w,
                              padding: EdgeInsets.only(left: 6.w, right: 8.w),
                              decoration: BoxDecoration(
                                color: appOrange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      color: appSecondary,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      'QR Codes',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: appSecondary),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        SearchBar_(), //SearcBar.dart
                        InkWell(
                          //Filter
                          onTap: () {},
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 35,
                            color: appTertiary,
                          ),
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      //remove this later
                      height: 900.h,
                    ),
                    Text('Hello'),
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
