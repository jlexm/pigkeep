import 'package:flutter/material.dart';
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
                    preferredSize: Size.fromHeight(35.0),
                    child: AppBar(
                      actions: [
                        IconButton(
                            //Sync
                            onPressed: () {},
                            icon: Icon(
                              Icons.sync,
                              color: appTertiary,
                              size: 30.0,
                            )),
                        SizedBox(
                          width: 10,
                        )
                      ],
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Builder(
                          builder: (context) {
                            return IconButton(
                              icon:
                                  Icon(Icons.menu, color: appPrimary, size: 30),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),
                      ),
                      backgroundColor:
                          appSecondary, // Set your desired color for the AppBar
                    ),
                  )
                : null,
        drawer: Hamburger(),
        body: widget.child,
        bottomNavigationBar: BottomNav(),
      );
}
