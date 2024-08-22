
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class CarouselMedicalrecords extends StatefulWidget {
  final List<int> items; 

  const CarouselMedicalrecords({super.key, required this.items});

  @override
  State<CarouselMedicalrecords> createState() => _CarouselMedicalrecordsState();
}

class _CarouselMedicalrecordsState extends State<CarouselMedicalrecords> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          final int item = widget.items[index];

          return Container(
            padding: EdgeInsets.only(left: 10.w,),
            width: MediaQuery.of(context).size.width * 0.35.w,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                        '$item',
                        style: TextStyle(
                            height: 0.9.h,
                            fontSize: 35.sp,
                            color: appBlue,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'mg',
                        style: TextStyle(
                            height: 0.9.h,
                            fontSize: 25.sp,
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
                        'Monensin',
                        style: TextStyle(fontSize: 16.0.sp),
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
