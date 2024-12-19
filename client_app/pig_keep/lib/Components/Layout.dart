import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/data-sync-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

class Layout extends StatefulWidget {
  final Widget child;
  final String currentRoute;
  const Layout({super.key, required this.child, required this.currentRoute});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  //services
  final syncService = globalLocator.get<DataSyncService>();

  // vars
  var selectedFarm;
  late String userOwner;
  bool isSyncLoading = true;

  @override
  void initState() {
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
    super.didChangeDependencies();
  }

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
                    onTap: () {
                      setState(() {
                        isSyncLoading = !isSyncLoading;
                      });
                      syncService
                          .syncAllData(selectedFarm['_id'], userOwner)
                          .then((_) async {
                        // Wait for 3 seconds after syncAllData is complete
                        await Future.delayed(Duration(milliseconds: 1));

                        // Ensure the widget is still mounted before accessing the context
                        if (mounted) {
                          context.read<GlobalProvider>().reloadCurrentFarm();
                        }
                      }).catchError((error) {
                        // Handle any errors during syncAllData
                        print("Error syncing data: $error");
                      });
                    },
                    child: AnimatedRotation(
                      turns: isSyncLoading ? 3.0 : 0.0,
                      duration:
                          Duration(seconds: 3), // Duration of one full rotation

                      child: Image.asset(
                        'assets/icons/Sync.png',
                        width: 25, // Adjust width as needed
                        height: 25, // Adjust height as needed
                      ),
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
