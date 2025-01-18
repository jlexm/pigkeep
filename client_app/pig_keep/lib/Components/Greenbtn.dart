import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

Widget MyGreenBtn({
  required String name,
  required VoidCallback onPressed,
  double borderRadius = 8.0,
}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(appPrimary),
        foregroundColor: WidgetStateProperty.all(appSecondary),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: appSecondary,
        ),
      ),
    ),
  );
}
