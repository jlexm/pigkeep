import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Components/Current_Events.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Carousel_PigCount.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Screens/Records.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

// ExpansionTile for dropdown

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    // fetchfarm
    Future.microtask(() async {
      await context.read<GlobalProvider>().fetchFarms();
      setState(() {
        isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: appSecondary,
      body: SafeArea(
        child: Column(
          children: [
            // Scroll starts here
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(child: FarmName()), //FarmName.dart
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manage your pig farm with PigKeep’s record \nkeeping feature and QR scanner.',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '42',
                            style: TextStyle(
                              fontSize: 110.sp,
                              fontWeight: FontWeight.bold,
                              height: 0.9.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Pigs',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: appPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            Text(
                              'Pig Count',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: appTertiary,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.push('/records');
                          },
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(right: 30)),
                              Text(
                                'See all',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: appPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    const CarouselPigCount(), //Carousel_PigCount.dart
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            Image.asset('assets/icons/Notification.png')
                          ],
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 30)),
                            Text(
                              'Notifications',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: appTertiary,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.push('/events');
                          },
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(right: 30)),
                              Text(
                                'See events',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: appPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const CurrentEvents(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
