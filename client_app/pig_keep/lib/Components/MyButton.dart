import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

Widget MyButton({required String name, required VoidCallback onPressed}) {
  return SizedBox(
    height: 42.h,
    width: double.infinity,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(appPrimary),
        foregroundColor: WidgetStateProperty.all(appSecondary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r), 
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(double.infinity, 50.h), 
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: appSecondary,
        ),
      ),
    ),
  );
}
