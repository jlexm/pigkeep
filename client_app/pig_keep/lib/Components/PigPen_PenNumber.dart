import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class PigPenPenNumber extends StatefulWidget {
  final String number;
  final String type;
  final String pigCount;
  final String maxPigs;

  const PigPenPenNumber({
    Key? key,
    required this.number,
    required this.type,
    required this.pigCount,
    required this.maxPigs,
  }) : super(key: key);

  @override
  State<PigPenPenNumber> createState() => _PigPenPenNumberState();
}

class _PigPenPenNumberState extends State<PigPenPenNumber> {
  @override
  Widget build(BuildContext context) {
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
                      widget.number,
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
          padding: EdgeInsets.only(left: 20.w),
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
                    widget.type,
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
                    widget.pigCount,
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
                    widget.maxPigs,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: appPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 45.h,
        ),
        Container(
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Pigs List",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: appPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 8.h),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       // Column 1
              //       Expanded(
              //         flex: 1,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: column1Items.map((item) {
              //             return Row(
              //               children: [
              //                 Icon(
              //                   Icons.circle,
              //                   color: appBlue,
              //                   size: 15.h,
              //                 ),
              //                 SizedBox(width: 4.w),
              //                 Text(
              //                   item['text'],
              //                   style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //               ],
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //       // Column 2
              //       Expanded(
              //         flex: 1,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: column2Items.map((item) {
              //             return Row(
              //               children: [
              //                 Icon(
              //                   Icons.circle,
              //                   color: appBlue,
              //                   size: 15.h,
              //                 ),
              //                 SizedBox(width: 4.w),
              //                 Text(
              //                   item['text'],
              //                   style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //               ],
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //       // Column 3
              //       Expanded(
              //         flex: 1,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.end,
              //           children: column3Items.map((item) {
              //             return Row(
              //               children: [
              //                 Icon(
              //                   Icons.circle,
              //                   color: appBlue,
              //                   size: 15.h,
              //                 ),
              //                 SizedBox(width: 4.w),
              //                 Text(
              //                   item['text'],
              //                   style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //               ],
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
        // Container(
        //   child: Expanded(
        //       child: Column(
        //     children: [],
        //   )),
        // ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            InkWell(
              onTap: () {Navigator.of(context).pop();},
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
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
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
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 32.h,
                width: 72.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1.5),
                    color: appSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
        ),
        
      ],
    );
  }
}
