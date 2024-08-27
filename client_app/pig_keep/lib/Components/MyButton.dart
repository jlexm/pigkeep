import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

Widget MyButton({required String name, required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(appPrimary),
        foregroundColor: WidgetStateProperty.all(appSecondary),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: appSecondary,
        ),
      ),
    ),
  );
}
