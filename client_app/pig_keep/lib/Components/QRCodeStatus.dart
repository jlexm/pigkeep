import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class QRCodeStatus extends StatefulWidget {
  const QRCodeStatus({super.key});

  @override
  State<QRCodeStatus> createState() => _QRCodeStatusState();
}

class _QRCodeStatusState extends State<QRCodeStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 35.h,
                  width: 83.w,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: appTertiary, width: 1),
                      left: BorderSide(color: appTertiary, width: 1),
                      bottom: BorderSide(color: appTertiary, width: 1),
                    ),
                    color: appBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Alive',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 35.h,
                  width: 83.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: appTertiary, width: 1),
                    color: appPrimary,
                  ),
                  child: Center(
                    child: Text(
                      'Sold',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 35.h,
                  width: 83.w,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: appTertiary, width: 1),
                      right: BorderSide(color: appTertiary, width: 1),
                      bottom: BorderSide(color: appTertiary, width: 1),
                    ),
                    color: appRed,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Alive',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 135.h,
              child: Text(
                '006',
                style: TextStyle(
                  fontSize: 100.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              'Pig Number',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: appPrimary,
              ),
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        )
        
      ],
    );
  }
}
