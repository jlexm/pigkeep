

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';

class FarmName extends StatefulWidget {
  const FarmName({super.key});

  @override
  _FarmNameState createState() => _FarmNameState();
}

class _FarmNameState extends State<FarmName> {
  String? _selectedValue = 'Alex Pig Farm';
  List<String> _farmNames = [
    'Alex Pig Farm',
    'Dominic Pig Farm',
    'Den\'s Farm'
  ];

  void _addNewFarm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController farmNameController = TextEditingController();
        TextEditingController addressController = TextEditingController();

        return ReusableDialogBox(
          title: 'Add Farm',
          description: 'Fill up the form to add a pig farm',
          formFields: [
            RecyclableTextFormField(
              controller: farmNameController,
              labelText: 'Farm Name',
              hintText: 'Farm Name',
              hintTextSize: 14.sp,
              icon: Icons.add,
              textSize: 14.sp,
              height: 43.h,
            ),
            RecyclableTextFormField(
              controller: addressController,
              labelText: 'Address',
              hintText: 'Address',
              hintTextSize: 14.sp,
              icon: Icons.location_on,
              textSize: 14.sp,
              height: 43.h,
            ),
          ],
          onSave: () {
            String farmName = farmNameController.text;
            String address = addressController.text;

            if (farmName.isNotEmpty && address.isNotEmpty) {
              setState(() {
                _farmNames.add(farmName);
                _selectedValue = farmName;
                // store the address here
              });
              Navigator.of(context).pop();
            }
          },
          saveButtonText: 'Add',
          saveButtonColor: appPrimary,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        top: 5.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250
                    .w, 
                child: DropdownButton<String>(
                  value: _selectedValue,
                  isExpanded: true, 
                  items: _farmNames.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment:
                            Alignment.centerLeft, 
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: appTertiary,
                          ),
                        ),
                      ),
                    );
                  }).toList()
                    ..add(
                      DropdownMenuItem<String>(
                        value: 'Add New Farm',
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/Add.png',
                                color: appPrimary,
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Add New Farm',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: appPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  onChanged: (String? newValue) {
                    if (newValue == 'Add New Farm') {
                      _addNewFarm();
                    } else {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    }
                  },
                  underline: SizedBox(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: appPrimary,
                  ),
                  selectedItemBuilder: (BuildContext context) {
                    return _farmNames.map((String value) {
                      return Text(
                        value,
                        style: TextStyle(
                          fontSize: value == _selectedValue ? 24.sp : 14.sp,
                          fontWeight: value == _selectedValue
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: appTertiary,
                        ),
                      );
                    }).toList()
                      ..add(
                        Text(
                          'Add New Farm',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: appPrimary,
                          ),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
