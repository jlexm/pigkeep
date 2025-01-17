import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Services/network-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/Store/auth_storage.dart';

class Hamburger extends StatefulWidget {
  const Hamburger({super.key});

  @override
  _HamburgerState createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  String name = '';
  String profile_pic = 'assets/icons/Farmer.png';

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final currUserJSON = await AuthStorage.getUser();
    // throw error if user does not exists in storage
    if (currUserJSON == null) {
      throw 'Current user not found.';
    }
    // decode currUser json string
    final currUser = jsonDecode(currUserJSON);
    String? fetchedName = '${currUser['first_name']} ${currUser['last_name']}';
    String? pic = currUser['profile_pic'];
    if (fetchedName != null) {
      setState(() {
        name = fetchedName;
        if (pic != null) {
          profile_pic = pic;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appPrimary,
      child: Column(
        children: [
          Container(
            color: appPrimary,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16.w),
                    CircleAvatar(
                      backgroundImage: AssetImage(profile_pic),
                      radius: 25.0,
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: appSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  //FARM
                  leading: Image.asset(
                    'assets/icons/Farm_white.png',
                    width: 30.w,
                    height: 30.h,
                  ),
                  title: Text(
                    "Farm",
                    style: TextStyle(
                      color: appSecondary,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push('/home');
                  },
                ),
                ListTile(
                  //Caretakers
                  leading: Image.asset(
                    'assets/icons/Caretaker.png',
                    width: 30.w,
                    height: 30.h,
                  ),
                  title: Text(
                    "Caretakers",
                    style: TextStyle(
                      color: appSecondary,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () async {
                    if (!await NetworkService.checkInternetConnection()) {
                      ToastService().showWarningToast(
                          'This feature requires a stable internet connection.');
                      return;
                    }
                    Navigator.of(context).pop();
                    context.push('/caretakers');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings, // Replace with the desired icon
                    color: appSecondary, // Match the color to your theme
                    size: 30.sp, // Adjust the size to your preference
                  ),
                  title: Text(
                    "Pig Age Category",
                    style: TextStyle(
                      color: appSecondary,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push('/agecategory');
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                ListTile(
                  //Profile Details
                  leading: Image.asset(
                    'assets/icons/Profile_Details.png',
                    width: 30.w,
                    height: 30.h,
                  ),
                  title: Text(
                    "Profile Details",
                    style: TextStyle(
                      color: appSecondary,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () async {
                    if (!await NetworkService.checkInternetConnection()) {
                      ToastService().showWarningToast(
                          'This feature requires a stable internet connection.');
                      return;
                    }

                    Navigator.of(context).pop();
                    context.push('/profiledetails');
                  },
                ),
                ListTile(
                  //Change Password
                  leading: Image.asset(
                    'assets/icons/Change_Password.png',
                    width: 30.w,
                    height: 30.h,
                  ),
                  title: Text(
                    "Change Password",
                    style: TextStyle(
                      color: appSecondary,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () async {
                    if (!await NetworkService.checkInternetConnection()) {
                      ToastService().showWarningToast(
                          'This feature requires a stable internet connection.');
                      return;
                    }
                    Navigator.of(context).pop();
                    context.push('/changepassword');
                  },
                ),
                SizedBox(
                  height: 250.h,
                ),
                ListTile(
                  //Logout
                  leading: Image.asset(
                    'assets/icons/Logout.png',
                    width: 29.w,
                    height: 29.h,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      color: appSecondary,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    AuthStorage.clearToken();
                    AuthStorage.setUserFarms("[]");
                    AuthStorage.clearUserAgeCategorySettings();
                    context.go('/login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
