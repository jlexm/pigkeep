import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class CaretakersList extends StatefulWidget {
  const CaretakersList({super.key});

  @override
  State<CaretakersList> createState() => _CaretakersListState();
}

class _CaretakersListState extends State<CaretakersList> {
  final List<Map<String, String>> caretakers = [
    {
      'name': 'John Doe',
      'phone': '09123456789',
    },
    {
      'name': 'Jane Smith',
      'phone': '09129876543',
    },
    {
      'name': 'Emily Johnson',
      'phone': '09122334455',
    },
    {
      'name': 'Michael Brown',
      'phone': '09127654321',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var caretaker in caretakers)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/Farmer.png',
                  scale: 10.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  caretaker['name']!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: appPrimary,
                  ),
                ),
                Spacer(),
                Text(
                  caretaker['phone']!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: appTertiary,
                  ),
                ),
              ],
            ),
          ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 32.h,
                width: 106.w,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: appPrimary,
                ),
                child: Center(
                  child: Text(
                    'Add Caretaker',
                    style: TextStyle(
                      color: appSecondary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
