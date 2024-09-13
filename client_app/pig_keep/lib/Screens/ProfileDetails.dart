import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/Greenbtn.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/MyUsernameField.dart';
import 'package:pig_keep/Constants/color.constants.dart';

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
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FarmName(), //FarmName.dart
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manage your profile details. Fill and update your \ninformation to let people know who you are.',
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
                            child: Image.asset(
                              'assets/images/junmar.png',
                              fit: BoxFit.cover,
                              width: 133,
                              height: 133,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change Profile Picture',
                            style: TextStyle(
                              color: appTertiary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                            ),
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
                            //email
                            controller: _emailController,
                            labelText: 'Email',
                            hintText: 'Enter your Email',
                            icon: Icons.mail,
                            textSize: 14.sp,
                            height: 43.h,
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
                          RecyclableTextFormField(
                            //username
                            controller: _usernameController,
                            labelText: 'Username',
                            hintText: 'Enter your Username',
                            icon: Icons.mail,
                            //iconSize: 20,
                            textSize: 14.sp,
                            height: 43.h,
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
                            //firstname
                            controller: _firstnameController,
                            labelText: 'First Name',
                            hintText: 'Enter your First Name',
                            icon: Icons.mail,
                            textSize: 14.sp,
                            height: 43.h,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your First Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            //lastname
                            controller: _lastnameController,
                            labelText: 'Last Name',
                            hintText: 'Enter your Last Name',
                            icon: Icons.mail,
                            textSize: 14.sp,
                            height: 43.h,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Last Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            //address
                            controller: _addressController,
                            labelText: 'Address',
                            hintText: 'Enter your Address',
                            icon: Icons.home,
                            iconSize: 30.0,
                            textSize: 14.sp,
                            height: 43.h,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            //phonenumber
                            controller: _phonenumberController,
                            labelText: 'Phone Number',
                            hintText: 'Enter your Phone Number',
                            icon: Icons.phone_outlined ,
                            textSize: 14.sp,
                            height: 43.h,
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
                            onPressed: () {},
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
