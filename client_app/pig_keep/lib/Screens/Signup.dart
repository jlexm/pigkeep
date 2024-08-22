import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Components/IconInputForm.dart';
import 'package:pig_keep/Components/ImageInputForm.dart';
import 'package:pig_keep/Components/myButton.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 130.h,
                ),
                Row(
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'Create an account to start managing your pig farm.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                IconInputForm(
                  labelText: 'Email',
                  controller: _emailController,
                  prefixIcon: Icons.email_rounded,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ImageInputForm(
                  labelText: 'Username',
                  controller: _usernameController,
                  prefixIcon: Image.asset(
                    'assets/icons/PrefixUser.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                IconInputForm(
                  prefixIcon: Icons.phone_enabled_outlined,
                  labelText: 'Phone Number',
                  controller: _phoneController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                IconInputForm(
                  prefixIcon: Icons.lock_rounded,
                  labelText: 'Password',
                  controller: _passController,
                  suffixIcon: Icons.visibility_off_rounded,
                ),
                SizedBox(
                  height: 10.h,
                ),
                IconInputForm(
                  prefixIcon: Icons.lock_rounded,
                  labelText: 'Confirm Password',
                  controller: _confirmpassController,
                  suffixIcon: Icons.visibility_off_rounded,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  name: 'Sign Up',
                  onPressed: () {
                    context.go('/home');
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 4.w,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go('/login');
                          },
                          child: Text(
                            'Log-in',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w300,
                              color: appPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
