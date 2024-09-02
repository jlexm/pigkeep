import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FarmName extends StatefulWidget {
  const FarmName({super.key});

  @override
  _FarmNameState createState() => _FarmNameState();
}

class _FarmNameState extends State<FarmName> {
  String? _selectedValue = 'Alex Pig Farm';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _selectedValue ?? 'Alex Pig Farm',
              style: TextStyle(
                fontSize: 3.sp,
                fontWeight: FontWeight.w300,
                color: appSecondary,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            DropdownButton<String>(
              value: _selectedValue,
              items: <String>['Alex Pig Farm', 'Dominic', 'Den']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.arrow_drop_down,
                color: appPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
