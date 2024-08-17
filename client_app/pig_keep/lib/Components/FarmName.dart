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
          mainAxisAlignment: MainAxisAlignment.start, // Align children to the left
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: [
            Text(
              _selectedValue ?? 'Alex Pig Farm', // Default text value
              style: TextStyle(
                fontSize: 3.sp, // Increased font size
                fontWeight: FontWeight.w700,
                color: appSecondary, // Optional: set text color
              ),
            ),
            SizedBox(width: 6.w), // Space between the text and dropdown
            DropdownButton<String>(
              value: _selectedValue,
              items: <String>[
                'Alex Pig Farm', // Updated dropdown item
                'Dominic', 
                'Den'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 23.sp, // Match the text size in the dropdown
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
              underline: SizedBox(), // Remove the underline
              icon: Icon(Icons.arrow_drop_down, color: appPrimary), // Dropdown arrow icon
            ),
          ],
        ),
      ],
    );
  }
}
