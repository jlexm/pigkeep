import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class Layout extends StatefulWidget {
  final Widget child;
  const Layout({super.key, required this.child});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: appSecondary,
        appBar:
            // hides app bar when scan-qr
            GoRouter.of(context)
                        .routeInformationProvider
                        .value
                        .uri
                        .toString() !=
                    '/scan-qr'
                ? PreferredSize(
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
                        const SizedBox(
                          width: 25,
                        )
                      ],
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Builder(
                          builder: (context) {
                            return IconButton(
                              icon: Icon(Icons.menu,
                                  color: appPrimary, size: 35.h),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),
                      ),
                      backgroundColor: appSecondary,
                    ),
                  )
                : null,
        drawer: const Hamburger(),
        body: widget.child,
        bottomNavigationBar: const BottomNav(),
      );
}
