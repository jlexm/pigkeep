import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/DataTable.dart';
import 'package:pig_keep/Components/SearchBar_PigPen.dart';
//import 'package:pig_keep/Components/SearchBar_PigPen.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class PigPen extends StatefulWidget {
  const PigPen({super.key});

  @override
  State<PigPen> createState() => _PigPenState();
}

class _PigPenState extends State<PigPen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //Greenbox
          children: [
            SizedBox(
              width: 20.w,
            ),
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
                          '05',
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
                          'Total \nPigpens',
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
                          padding: EdgeInsets.only(left: 9.w, right: 9.w),
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
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 11.h,
        ),
        Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: SearchBarPigPen(), //SearchBar_PigPen.dart
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: MyDataTable(),
        ),
        SizedBox(
          //remove this later
          height: 600.h,
        ),
        Text('-End of SCSV-'),
      ],
    );
  }
}
