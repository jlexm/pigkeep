import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPigCount extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  const CarouselPigCount({super.key, required this.data});

  @override
  State<CarouselPigCount> createState() => _CarouselPigCountState();
}

class _CarouselPigCountState extends State<CarouselPigCount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.h),
      child: CarouselSlider(
        options: CarouselOptions(
          padEnds: false,
          height: 120.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.32,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          enlargeFactor: 0.01,
          scrollDirection: Axis.horizontal,
        ),
        items: widget.data.map((item) {
          return Builder(
            builder: (BuildContext context) {
              final isMatured = item['text'] == 'Matured'; // Check "Matured"

              return Container(
                width: MediaQuery.of(context).size.width * 0.30.w,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: appPrimary, width: 1.5.w),
                  color: isMatured ? appPrimary : appSecondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['number']!,
                        style: TextStyle(
                          height: 0.9.h,
                          fontSize: 70.h,
                          color: isMatured ? appSecondary : appPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        item['text']!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: isMatured ? appSecondary : Colors.black,
                        ),
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
