import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Carousel_PigCount.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/Notifications.dart';

class Chips extends StatefulWidget {
  const Chips({super.key});

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  int? _selectedChoiceIndex = 0; // Set to 0 by default for the first chip

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Added horizontal scrolling
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            Container(
              width: 70.w,
              padding: EdgeInsets.symmetric(horizontal: 0.w), // Reduced gap
              child: ChoiceChip(
                label: Container(
                  width: 40.w, // Adjust width as needed
                  alignment: Alignment.center,
                  child: Text(
                    'Pig List',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: _selectedChoiceIndex == 0
                          ? appSecondary
                          : appTertiary,
                    ),
                  ),
                ),
                selected: _selectedChoiceIndex == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoiceIndex = selected ? 0 : null;
                  });
                },
                selectedColor: appPrimary,
                backgroundColor: appSecondary,
                showCheckmark: false, // Remove checkmark
              ),
            ),
            Container(
              width: 125.w,
              padding: EdgeInsets.symmetric(horizontal: 5.w), // Reduced gap
              child: ChoiceChip(
                label: Container(
                  width: 90.w, // Adjust width as needed
                  alignment: Alignment.center,
                  child: Text(
                    'Feed Inventory',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: _selectedChoiceIndex == 1
                          ? appSecondary
                          : appTertiary,
                    ),
                  ),
                ),
                selected: _selectedChoiceIndex == 1,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoiceIndex = selected ? 1 : null;
                  });
                },
                selectedColor: appPrimary,
                backgroundColor: appSecondary,
                showCheckmark: false, // Remove checkmark
              ),
            ),
            Container(
              width: 130.w,
              padding: EdgeInsets.symmetric(horizontal: 0.w), // Reduced gap
              child: ChoiceChip(
                label: Container(
                  width: 125.w, // Adjust width as needed
                  alignment: Alignment.center,
                  child: Text(
                    'Medical Records',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: _selectedChoiceIndex == 2
                          ? appSecondary
                          : appTertiary,
                    ),
                  ),
                ),
                selected: _selectedChoiceIndex == 2,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoiceIndex = selected ? 2 : null;
                  });
                },
                selectedColor: appPrimary,
                backgroundColor: appSecondary,
                showCheckmark: false, // Remove checkmark
              ),
            ),
            Container(
              width: 82.w,
              padding: EdgeInsets.symmetric(horizontal: 5.w), // Reduced gap
              child: ChoiceChip(
                label: Container(
                  width: 45.w, // Adjust width as needed
                  alignment: Alignment.center,
                  child: Text(
                    'Pig Pen',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: _selectedChoiceIndex == 3
                          ? appSecondary
                          : appTertiary,
                    ),
                  ),
                ),
                selected: _selectedChoiceIndex == 3,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoiceIndex = selected ? 3 : null;
                  });
                },
                selectedColor: appPrimary,
                backgroundColor: appSecondary,
                showCheckmark: false, // Remove checkmark
              ),
            ),
          ],
        ),
      ),
    );
  }
}
