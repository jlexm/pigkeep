import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Screens/Home.dart';
import 'package:pig_keep/Screens/Profile.dart';
import 'package:pig_keep/Screens/Records.dart';
import 'package:pig_keep/Screens/ScanQR.dart';
import 'package:pig_keep/Screens/Events.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int index = 0;

  final screens = [
    Home(),
    Records(),
    ScanQR(),
    Events(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: appSecondary,
        appBar: index == 2
            ? null // Hide the AppBar if index is 2
            : AppBar(
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.menu, color: appPrimary, size: 30),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
            ),
            backgroundColor: appSecondary, // Set your desired color for the AppBar
          ),
        drawer: Hamburger(),
        body: Stack(
          children: [
            IndexedStack(
              index: index,
              children: screens,
            ),
            BottomNav(onNavItemTap: (int idx) {
              setState(() {
                index = idx;
              });
            },)
          ],
        ),  
      );
}
