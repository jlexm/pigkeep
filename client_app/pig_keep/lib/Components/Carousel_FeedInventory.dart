import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Models/feed.dart';

class CarouselFeedInventory extends StatefulWidget {
  final List<Feed> items;
  final Future<void> feedFeedData;
  final String farmID;

  const CarouselFeedInventory(
      {super.key,
      required this.items,
      required this.feedFeedData,
      required this.farmID});

  @override
  State<CarouselFeedInventory> createState() => _CarouselFeedInventoryState();
}

class _CarouselFeedInventoryState extends State<CarouselFeedInventory> {
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
          viewportFraction: 0.46,
          initialPage: 1,
          enableInfiniteScroll: false,
          reverse: false,
          enlargeFactor: 0.01,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final Feed item = widget.items[index];

          return Container(
            padding: EdgeInsets.only(
              left: 10.w,
            ),
            width: MediaQuery.of(context).size.width * 0.35.w,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              border: Border.all(color: appPrimary, width: 1.5.w),
              color: appSecondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${item.weightKG} kg',
                        style: TextStyle(
                            height: 0.9.h,
                            fontSize: 22.sp,
                            color: appPrimary,
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
                       '${item.feedType.length > 15 ? item.feedType.substring(0, 15) + '...' : item.feedType}',
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
