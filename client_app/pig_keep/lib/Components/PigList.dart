import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/DataTable.dart';
import 'package:pig_keep/Components/SearchBar_PigList.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class PigList extends StatefulWidget {
  const PigList({super.key});

  @override
  State<PigList> createState() => _PigListState();
}

class _PigListState extends State<PigList> {
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
            SearchBar_PigList(), //SearcBar_PigList.dart
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
              width: 18.w,
            ),
          ],
        ),
        Column(
          children: [
            MyDataTable(), //DatarTable.dart
          ],
        ),
        SizedBox(
          //remove this later
          height: 600.h,
        ),
        Text('-End of SCSV-'),
        SizedBox(
          //remove this later
          height: 110.h,
        ),
      ],
    );
  }
}
