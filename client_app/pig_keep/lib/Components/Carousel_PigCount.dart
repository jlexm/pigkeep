import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPigCount extends StatefulWidget {
  const CarouselPigCount({super.key});

  @override
  State<CarouselPigCount> createState() => _CarouselPigCountState();
}

class _CarouselPigCountState extends State<CarouselPigCount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      child: CarouselSlider(
        options: CarouselOptions(
          padEnds: false,
          height: 120.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.40,
          initialPage: 1,
          enableInfiniteScroll: false,
          reverse: false,
          enlargeFactor: 0.01,
          scrollDirection: Axis.horizontal,
        ),
        items: [12, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.35.w,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: appPrimary, width: 1.5.w),
                  color: appSecondary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$i',
                        style: TextStyle(
                            height: 0.9.h,
                            fontSize: 70.h,
                            color: appPrimary,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Weaner',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
