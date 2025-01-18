import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class SearchBar_PigList extends StatelessWidget {
  final void Function(String) onSearch;
  const SearchBar_PigList({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      height: 34.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: appTertiary,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search, color: appTertiary),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search by Pig Number',
                iconColor: appTertiary,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(fontSize: 12.sp),
              onChanged: onSearch,
            ),
          ),
        ],
      ),
    );
  }
}
