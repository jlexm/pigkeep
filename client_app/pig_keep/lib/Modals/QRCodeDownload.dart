import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class QRCodeDownload extends StatelessWidget {
  final String title;
  final String saveButtonText;
  final IconData saveButtonIcon;
  final Color saveButtonColor;
  final int number;
  final String imagePath;
  final VoidCallback onSave;

  const QRCodeDownload({
    Key? key,
    required this.title,
    required this.saveButtonText,
    required this.saveButtonIcon,
    required this.saveButtonColor,
    required this.number,
    required this.imagePath,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format number with leading zeros
    String formattedNumber = number.toString().padLeft(3, '0');

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
                color: appTertiary,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              // Downloadable PNG for QR code
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: formattedNumber
                        .split('')
                        .reversed
                        .map((digit) => RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                height: 70.h,
                                child: Text(
                                  digit,
                                  style: TextStyle(
                                    height: 1.h,
                                    fontSize: 70.sp,
                                    fontWeight: FontWeight.w700,
                                    color: appTertiary,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 430.h,
                      maxWidth: 170.w,
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: onSave,
                style: ElevatedButton.styleFrom(
                  foregroundColor: appSecondary,
                  backgroundColor: saveButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                icon: Icon(saveButtonIcon),
                label: Text(saveButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
