import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/Greenbtn.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';

class Createfarm extends StatefulWidget {
  const Createfarm({super.key});

  @override
  State<Createfarm> createState() => _CreatefarmState();
}

class _CreatefarmState extends State<Createfarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.h,
              ),
              Text(
                'You do not have a pig farm to manage yet. \n Create a pig farm to begin your pig farm management experience.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 100.w,
                child: MyGreenBtn(
                  name: 'Create',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReusableDialogBox(
                          title: 'Farm Creation',
                          description: 'Enter the name of your pig farm.',
                          formFields: [
                            RecyclableTextFormField(
                              controller: TextEditingController(),
                              labelText: 'Farm Name',
                              hintText: 'Farm Name',
                              hintTextSize: 14.sp,
                              icon: Icons.house,
                              textSize: 14.sp,
                              height: 43.h,
                            ),
                            RecyclableTextFormField(
                              controller: TextEditingController(),
                              labelText: 'Farm Address',
                              hintText: 'Farm Address',
                              hintTextSize: 14.sp,
                              icon: Icons.house,
                              textSize: 14.sp,
                              height: 43.h,
                            ),
                          ],
                          onSave: () {
                            // Handle the save action, e.g., validate and save data
                            print('Form saved');
                            Navigator.of(context).pop();
                          },
                          saveButtonText: 'Create',
                          saveButtonColor: appPrimary,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
