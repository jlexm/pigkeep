import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Api/user_api.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/Greenbtn.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/ImageInputForm.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/Store/auth_storage.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

void _saveProfile() {}

class _ProfileDetailsState extends State<ProfileDetails> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();

  // add more options here
  List<String> profileOptions = [
    'assets/icons/Farmer.png',
    'assets/userIcons/female.png',
    'assets/userIcons/male.png',
    'assets/userIcons/neutral.png'
  ];

  int currentOptionIndex = 0;
  int role_id = 3;

  Future<void> getInitialData() async {
    var user = await UserApi.getMyDetails();
    _emailController.text = user['email'] ?? '';
    _usernameController.text = user['username'] ?? '';
    _firstnameController.text = user['first_name'] ?? '';
    _lastnameController.text = user['last_name'] ?? '';
    _phonenumberController.text = user['phone_number'] ?? '';
    String? pic = user['profile_pic'];
    print(user);
    if (pic != null) {
      int idx = profileOptions.indexOf(pic);
      if (idx == -1) {
        idx = 0; // default pic
      }
      setState(() {
        currentOptionIndex = idx;
        role_id = user['role_id'];
      });
    }
  }

  @override
  void initState() {
    getInitialData();
    super.initState();
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                int idx = currentOptionIndex - 1;
                                if (idx < 0) {
                                  idx = profileOptions.length - 1;
                                }
                                setState(() {
                                  currentOptionIndex = idx;
                                });
                              },
                              child: Icon(
                                Icons.chevron_left,
                                size: 50,
                                color: appPrimary,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: appPrimary, width: 1.5),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Opacity(
                                  opacity: 0.7,
                                  child: Image.asset(
                                    profileOptions[currentOptionIndex],
                                    fit: BoxFit.cover,
                                    width: 133,
                                    height: 133,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            InkWell(
                              onTap: () {
                                int idx = currentOptionIndex + 1;
                                if (idx > profileOptions.length - 1) {
                                  idx = 0;
                                }
                                setState(() {
                                  currentOptionIndex = idx;
                                });
                              },
                              child: Icon(
                                Icons.chevron_right,
                                size: 50,
                                color: appPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Choose Profile Picture',
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
                            //username
                            controller: _usernameController,
                            labelText: 'Username',
                            hintText: 'Enter your Username',
                            icon: Icons.person,
                            readOnly: true,
                            enabled: false,
                            //iconSize: 20,
                            textSize: 14.sp,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            //email
                            controller: _emailController,
                            labelText: 'Email',
                            hintText: 'Enter your Email',
                            icon: Icons.mail,
                            textSize: 14.sp,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 40.h,
                            child: ImageInputForm(
                              labelText: 'First Name',
                              controller: _firstnameController,
                              prefixIcon: Image.asset(
                                'assets/icons/Farmer.png',
                                scale: 13,
                                color: appTertiary,
                              ),
                              textStyle: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 40.h,
                            child: ImageInputForm(
                              labelText: 'Last Name',
                              controller: _lastnameController,
                              prefixIcon: Image.asset(
                                'assets/icons/Farmer.png',
                                scale: 13,
                                color: appTertiary,
                              ),
                              textStyle: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            //phonenumber
                            controller: _phonenumberController,
                            labelText: 'Phone Number',
                            hintText: 'Enter your Phone Number',
                            icon: Icons.phone_outlined,
                            textSize: 14.sp,
                            maxLength: 11,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Phone Number';
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
                                await UserApi.updateMyDetails({
                                  'email': _emailController.text,
                                  'phone_number': _phonenumberController.text,
                                  'first_name': _firstnameController.text,
                                  'last_name': _lastnameController.text,
                                  'profile_pic':
                                      profileOptions[currentOptionIndex]
                                });

                                // update localStorage username that was rcved from login api
                                await AuthStorage.setUser(jsonEncode({
                                  "username": _usernameController.text,
                                  "role_id": role_id,
                                  "first_name": _firstnameController.text,
                                  "last_name": _lastnameController.text,
                                  "profile_pic":
                                      profileOptions[currentOptionIndex]
                                }));

                                ToastService().showSuccessToast(
                                    "Succesfully updated profile");
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
