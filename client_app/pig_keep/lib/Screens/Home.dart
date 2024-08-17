import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< Updated upstream
import 'package:pig_keep/Components/Hamburger.dart';
=======
<<<<<<< HEAD
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Carousel_PigCount.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/Notifications.dart';
=======
import 'package:pig_keep/Components/Hamburger.dart';
>>>>>>> Stashed changes
import 'package:pig_keep/Constants/color.constants.dart';

// ExpansionTile for dropdown
>>>>>>> 74be76ace25a177e57fe360663c52798d7fe37e0

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
      drawer: Hamburger(),
=======
>>>>>>> 74be76ace25a177e57fe360663c52798d7fe37e0
>>>>>>> Stashed changes
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 30.h,
              child: Builder(
                builder: (context) => Container(
                  padding: EdgeInsets.only(left: 10.w),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.menu, color: appPrimary, size: 30),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: [
                FarmName(), //FarmName.dart
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sync,
                      color: appTertiary,
                      size: 30.0,
                    )),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manage your pig farm with PigKeep’s record \nkeeping feature and QR scanner.',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),

            // Scroll starts here
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text(
                              'Pig Count',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: appTertiary,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(right: 30)),
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
                          width: 20.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    CarouselPigCount(), //Carousel_PigCount.dart
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20)),
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
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text(
                              'Notifications',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: appTertiary,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(right: 30)),
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
                          width: 20.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Notifications(), //Notifications.dart
                    SizedBox(                                        //remove this later
                      height: 600.h,
                    ),
                    Text('Hello'),
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
