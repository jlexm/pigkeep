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
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

import '../Models/pig-pen.dart';

// ExpansionTile for dropdown

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isInitialized = false;

  // services
  final penService = globalLocator.get<PigPenService>();
  final pigService = globalLocator.get<PigService>();

  // pigs variables
  var selectedFarm;
  late String userOwner;
  int totalPigs = 0;
  int totalWeaner = 0;
  int totalPiglet = 0;
  int totalGrower = 0;
  int totalSow = 0;
  int totalBoar = 0;
  int totalMatured = 0;

  // functions
  Future<void> getPigs() async {
    // fetch all pens first
    List<PigPen> pens =
        await penService.fetchPigPens(selectedFarm['_id'], userOwner);
    final fetchPigs = await pigService.fetchAllPigsInAllPens(pens);

    // reset counts
    int ctotalPigs = 0;
    int ctotalWeaner = 0;
    int ctotalPiglet = 0;
    int ctotalGrower = 0;
    int ctotalSow = 0;
    int ctotalBoar = 0;
    int ctotalMatured = 0;

    // count all pigs
    fetchPigs.forEach((pig) {
      ctotalPigs += 1;
      switch (pig['ageCategory']) {
        case 'Weaner':
          ctotalWeaner += 1;
          break;
        case 'Piglet':
          ctotalPiglet += 1;
          break;
        case 'Grower':
          ctotalGrower += 1;
          break;
        case 'Sow':
          ctotalSow += 1;
          break;
        case 'Boar':
          ctotalBoar += 1;
          break;
        case 'Matured':
          ctotalMatured += 1;
          break;
      }
    });
    print(ctotalPigs);
    setState(() {
      totalPigs = ctotalPigs;
      totalWeaner = ctotalWeaner;
      totalPiglet = ctotalPiglet;
      totalGrower = ctotalGrower;
      totalSow = ctotalSow;
      totalBoar = ctotalBoar;
      totalMatured = ctotalMatured;
    });
  }

  @override
  void initState() {
    // fetchfarm
    Future.microtask(() async {
      await context.read<GlobalProvider>().fetchFarms();
      setState(() {
        isInitialized = true;
      });
    });
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      userOwner = user['username'];
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final farm = context.watch<GlobalProvider>().getSelectedFarm();
    setState(() {
      selectedFarm = farm;
    });
    getPigs();
    super.didChangeDependencies();
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
                            totalPigs.toString(),
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
                              const Padding(
                                  padding: EdgeInsets.only(right: 30)),
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
                    CarouselPigCount(
                      data: [
                        {'number': totalWeaner.toString(), 'text': 'Weaners'},
                        {'number': totalPiglet.toString(), 'text': 'Piglets'},
                        {'number': totalGrower.toString(), 'text': 'Growers'},
                        {'number': totalSow.toString(), 'text': 'Sows'},
                        {'number': totalBoar.toString(), 'text': 'Boars'},
                        {'number': totalMatured.toString(), 'text': 'Matured'}
                      ],
                    ), //Carousel_PigCount.dart
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
                              const Padding(
                                  padding: EdgeInsets.only(right: 30)),
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
