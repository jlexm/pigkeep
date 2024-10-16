import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Models/medicine.dart';
import 'package:pig_keep/Services/pig-helper.dart';

class CarouselMedicalrecords extends StatefulWidget {
  final List<Medicine> items;

  const CarouselMedicalrecords({super.key, required this.items});

  @override
  State<CarouselMedicalrecords> createState() => _CarouselMedicalrecordsState();
}

class _CarouselMedicalrecordsState extends State<CarouselMedicalrecords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 15.h,
      ),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          padEnds: false,
          height: 90.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.42,
          initialPage: 1,
          enableInfiniteScroll: false,
          reverse: false,
          enlargeFactor: 0.01,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final item = widget.items[index];

          return Container(
            padding: EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              border: Border.all(color: appBlue, width: 1.5.w),
              color: appSecondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${PigHelper.convertVolume(item.quantity, item.unit!)}',
                        style: TextStyle(
                            height: 0.9.h,
                            fontSize: 22.sp,
                            color: appBlue,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.medicineName,
                        style: TextStyle(fontSize: 12.0.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
