import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Api/user_api.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/Greenbtn.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/MyUsernameField.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/Store/auth_storage.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

void _saveProfile() {}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _oldpasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

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
    String? pic = currUser['profile_pic'];
    if (pic != null) {
      setState(() {
        profile_pic = pic;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      drawer: const Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: appPrimary, width: 1.5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset(
                                profile_pic,
                                fit: BoxFit.cover,
                                width: 133,
                                height: 133,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Change Password',
                          style: TextStyle(
                            color: appTertiary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          RecyclableTextFormField(
                            //old password
                            controller: _oldpasswordController,
                            obscureText: true,
                            labelText: 'Old Password',
                            hintText: 'Enter your Old Password',
                            icon: Icons.lock,
                            textSize: 14.sp,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Old Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            //new password
                            controller: _newpasswordController,
                            obscureText: true,
                            labelText: 'New Password',
                            hintText: 'Enter your New Password',
                            icon: Icons.lock,
                            textSize: 14.sp,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your New Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            //confirm password
                            controller: _confirmpasswordController,
                            obscureText: true,
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password',
                            icon: Icons.lock,
                            textSize: 14.sp,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter confirm your Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          MyGreenBtn(
                            name: "Save",
                            onPressed: () async {
                              try {
                                if (_newpasswordController.text !=
                                    _confirmpasswordController.text) {
                                  throw 'Confirm Password does not match!';
                                }

                                await UserApi.updatePassword(
                                    _oldpasswordController.text,
                                    _newpasswordController.text);

                                ToastService().showSuccessToast(
                                    "Succesfully updated password");
                              } catch (err) {
                                ToastService().showErrorToast(err.toString());
                              }
                            },
                            borderRadius: 10.0,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
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
