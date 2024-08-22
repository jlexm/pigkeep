import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/Carousel_FeedInventory.dart';
import 'package:pig_keep/Components/Carousel_MedicalRecords.dart';
import 'package:pig_keep/Components/SearchBar_MedicalRecords.dart';
import 'package:pig_keep/Components/Transaction_FeedInventory.dart';
import 'package:pig_keep/Components/Transaction_MedicalRecords.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Container(
                  height: 57.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: appBlue, width: 1.5),
                    color: appSecondary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Minus.png',
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text('Consume',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: appTertiary,
                              ))
                        ]),
                  )),
            ),
            Expanded(
              child: Container(
                  height: 57.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: appBlue, width: 1.5),
                    color: appBlue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Add.png',
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text('Add Meds',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: appSecondary,
                              ))
                        ]),
                  )),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: SearchBar_MedicalRecords()), //Searchbar_MedicalRecords.dart
        SizedBox(
          height: 18.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 15.w),
          child: CarouselMedicalrecords(//Carousel_MedicalRecords.dart
              items: [125, 125, 130, 200, 259]// Dynamic list of items
              ),
        ), 
        SizedBox(
          height: 17.h,
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
        TransactionMedicalrecords(), //Transaction_Medicalrecords.dart
        SizedBox(
          //remove this later
          height: 600.h,
        ),
        Text('-End of SCSV-'),
        SizedBox(
          //remove this later
          height: 110.h,
        ),
      ],
    );
  }
}
