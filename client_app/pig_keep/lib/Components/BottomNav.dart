import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class BottomNav extends StatefulWidget {

  final Function(int)? onNavItemTap;

  const BottomNav({super.key, this.onNavItemTap});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  @override
  Widget build(BuildContext context) => 
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 105,
        decoration: BoxDecoration(
          color: appSecondary,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNavItem(0, 'Home', 'assets/icons/Home.png'),
                buildNavItem(1, 'Records', 'assets/icons/Records.png'),
                40.horizontalSpace,
                buildNavItem(3, 'Events', 'assets/icons/Events.png'),
                buildNavItem(4, 'Profile', 'assets/icons/Profile.png'),
              ],
            ),
            Positioned(
              top: 0.r,
              child: buildNavItem(2, 'QR', 'assets/icons/ScanQR.png'),
            ),
          ],
        ),
      ),
    );

  Widget buildNavItem(int idx, String label, String iconPath) {
    double iconSize = idx == 2 ? 48.r : 36.r;
    Color iconColor =
        idx == 2 ? appPrimary : (index == idx ? appPrimary : appTertiary);
    return GestureDetector(
      onTap: () {
        setState(() {
          index = idx;
        });
        if(widget.onNavItemTap != null) {
          widget.onNavItemTap!(idx);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(iconPath),
            size: iconSize,
            color: iconColor,
          ),
          6.verticalSpace,
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
