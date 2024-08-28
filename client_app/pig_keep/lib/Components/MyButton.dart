import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

Widget MyButton({required String name, required VoidCallback onPressed}) {
  return SizedBox(
    height: 42.h,
    width: double.infinity,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(appPrimary),
        foregroundColor: MaterialStateProperty.all(appSecondary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r), 
          ),
        ),
        minimumSize: MaterialStateProperty.all(
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
