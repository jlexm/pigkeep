import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/DisposalLedger.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/SearchBar_DisposalLedger.dart';
import 'package:pig_keep/Components/SearchBar_MedicalRecords.dart';
import 'package:pig_keep/Components/SearchBar_PigList.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';

class Ledger extends StatefulWidget {
  const Ledger({super.key});

  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      drawer: const Hamburger(),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Row(
                  children: [
                    FarmName(),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20.w),
                      Text(
                        'Manage your pig farm with PigKeep’s record \nkeeping feature and QR scanner.',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 8.h,
                    bottom: 10.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Disposal Ledger",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: appPrimary,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Container(
                        height: 105.h,
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: appPrimary),
                          color: appPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Text(
                                      'June, 2024',
                                      style: TextStyle(
                                        color: appSecondary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        height: 1.5.h,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '₱',
                                              style: TextStyle(
                                                fontSize: 33.sp,
                                                fontWeight: FontWeight
                                                    .w500, 
                                                color: appSecondary,
                                                fontFamily:
                                                    'Roboto', 
                                              ),
                                            ),
                                            TextSpan(
                                              text: '230,000',
                                              style: TextStyle(
                                                fontSize: 33.sp,
                                                fontWeight: FontWeight
                                                    .w700, 
                                                color: appSecondary,
                                                fontFamily:
                                                    'Poppins', 
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 33.h,
                                  width: 100.w,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: appSecondary),
                                    color: appSecondary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ReusableDialogBox(
                                            title: 'Sell Pig',
                                            description:
                                                'Fill up the necessary information.',
                                            formFields: [
                                              RecyclableTextFormField(
                                                controller:
                                                    TextEditingController(),
                                                labelText: 'Pig Number',
                                                hintText: 'Pig Number',
                                                hintTextSize: 14.sp,
                                                icon: Icons.email,
                                                textSize: 14.sp,
                                                height: 43.h,
                                              ),
                                              RecyclableTextFormField(
                                                controller:
                                                    TextEditingController(),
                                                labelText: 'Weight in kg',
                                                hintText: 'Weight in kg',
                                                hintTextSize: 14.sp,
                                                icon: Icons.email,
                                                textSize: 14.sp,
                                                height: 43.h,
                                              ),
                                              RecyclableTextFormField(
                                                controller:
                                                    TextEditingController(),
                                                labelText: 'Price',
                                                hintText: 'Price',
                                                hintTextSize: 14.sp,
                                                icon: Icons.email,
                                                textSize: 14.sp,
                                                height: 43.h,
                                              ),
                                            ],
                                            onSave: () {
                                              // Handle the save action, e.g., validate and save data
                                              print('Form saved');
                                              Navigator.of(context).pop();
                                            },
                                            saveButtonText: 'Sell Pig',
                                            saveButtonColor: appPrimary,
                                          );
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/Add.png',
                                          width: 20.w,
                                          height: 20.h,
                                          color: appTertiary,
                                        ),
                                        SizedBox(width: 3.h),
                                        Text(
                                          'Sell Pig',
                                          style: TextStyle(
                                            color: appTertiary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  height: 33.h,
                                  width: 100.w,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: appSecondary),
                                    color: appPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ReusableDialogBox(
                                            title: 'Deceased Pig',
                                            description:
                                                'Fill up the necessary information.',
                                            formFields: [
                                              RecyclableTextFormField(
                                                controller:
                                                    TextEditingController(),
                                                labelText: 'Pig Number',
                                                hintText: 'Pig Number',
                                                hintTextSize: 14.sp,
                                                icon: Icons.email,
                                                textSize: 14.sp,
                                                height: 43.h,
                                              ),
                                            ],
                                            onSave: () {
                                              // Handle the save action, e.g., validate and save data
                                              print('Form saved');
                                              Navigator.of(context).pop();
                                            },
                                            saveButtonText: 'Remove',
                                            saveButtonColor: appRed,
                                          );
                                        },
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/Minus.png',
                                          width: 20.w,
                                          height: 20.h,
                                          color: appSecondary,
                                        ),
                                        SizedBox(width: 3.h),
                                        Text(
                                          'Deceased',
                                          style: TextStyle(
                                            color: appSecondary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 14.h,
                    bottom: 20.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: SearchBar_DisposalLedger(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Transaction History',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                const Column(
                  children: [
                    DisposalLedger(),
                  ],
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
