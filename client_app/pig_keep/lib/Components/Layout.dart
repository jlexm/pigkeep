import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class Layout extends StatefulWidget {
  final Widget child;
  final String currentRoute;
  const Layout({super.key, required this.child, required this.currentRoute});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    final isScanQrRoute =
        widget.currentRoute == '/scan-qr'; // Check current route

    return Scaffold(
      backgroundColor: appSecondary,
      appBar: isScanQrRoute
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: AppBar(
                actions: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/Sync.png',
                      width: 25.w,
                      height: 25.h,
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
                leading: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.menu, color: appPrimary, size: 35.h),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                ),
                backgroundColor: appSecondary,
              ),
            ),
      drawer: const Hamburger(),
      body: widget.child, // This should only be set once
      bottomNavigationBar: BottomNav(currentRoute: widget.currentRoute),
    );
  }
}
