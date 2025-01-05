import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pig_keep/Components/Chip.dart';
import 'package:pig_keep/Components/FarmName.dart';

import 'package:pig_keep/Constants/color.constants.dart';
import 'package:go_router/go_router.dart';

class Records extends StatefulWidget {
  Widget currentView;
  Records({super.key, required this.currentView});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        FarmName(),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Update your pig farm records to keep you on \ntrack with your pig farm management experience.',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Chips(onChipSelected: (int? index) {
                        if (index == 0) {
                          context.go('/records/pens');
                        } else if (index == 1) {
                          context.go('/records/pigs');
                        } else if (index == 2) {
                          context.go('/records/feeds');
                        } else if (index == 3) {
                          context.go('/records/medicines');
                        }
                      }),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      // Container containing Screens
                      child: widget.currentView,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
