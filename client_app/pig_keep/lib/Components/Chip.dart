import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class Chips extends StatefulWidget {
  final ValueChanged<int?> onChipSelected;

  const Chips({super.key, required this.onChipSelected});
  

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  int? _selectedChoiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildChip('Pig List', 0, 55.w), 
            _buildChip('Feed Inventory', 1, 95.w), 
            _buildChip('Medical Records', 2, 100.w), 
            _buildChip('Pig Pen', 3, 50.w), 
            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, int index, double width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: ChoiceChip(
        label: Container(
          alignment: Alignment.center,
          width: width, 
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: _selectedChoiceIndex == index ? appSecondary : appTertiary,
            ),
          ),
        ),
        selected: _selectedChoiceIndex == index,
        onSelected: (bool selected) {  
          if (selected && _selectedChoiceIndex != index) {
            setState(() {
              _selectedChoiceIndex = index;
            });
            widget.onChipSelected(_selectedChoiceIndex); 
          }
        },
        selectedColor: appPrimary,
        backgroundColor: appSecondary,
        showCheckmark: false,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: appPrimary,
            width: 1.0.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
