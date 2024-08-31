import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class CenterReusableDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onSave;
  final String saveButtonText;
  final Color saveButtonColor; // Parameter for save button background color

  const CenterReusableDialogBox({
    Key? key,
    required this.title,
    required this.description,
    required this.onSave,
    this.saveButtonText = 'Save',
    this.saveButtonColor = Colors.green, // Default to green
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: appTertiary,
              ),
              textAlign: TextAlign.center, 
            ),
            SizedBox(height: 6.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 12.sp,
                color: appTertiary,
              ),
              textAlign: TextAlign.center, 
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: saveButtonColor, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), 
                ),
              ),
              child: Text(
                saveButtonText,
                style: TextStyle(
                  color: appSecondary, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
