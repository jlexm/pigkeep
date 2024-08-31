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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/topLogin.png',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                children: [
                                   Row(
                                    children: [
                                      Text(
                                        'Sign up',
                                        style: TextStyle(
                                            color: appTertiary,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 30.sp,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                   Row(
                                    children: [
                                      Text(
                                        'Create an account to start managing your \npig farm.',
                                        style: TextStyle(
                                            color: appTertiary,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                    child: IconInputForm(
                                      labelText: 'Email',
                                      controller: _emailController,
                                      prefixIcon: Icons.email_rounded,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                    child: ImageInputForm(
                                      labelText: 'Username',
                                      controller: _usernameController,
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
                                    height: 14.h,
                                  ),
                                  SizedBox(
                                     height: 40.h,
                                    child: IconInputForm(
                                      prefixIcon: Icons.phone_enabled_outlined,
                                      labelText: 'Phone Number',
                                      controller: _phoneController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  SizedBox(
                                     height: 40.h,
                                    child: IconInputForm(
                                      prefixIcon: Icons.lock_rounded,
                                      labelText: 'Password',
                                      controller: _passController,
                                      suffixIcon: Icons.visibility_off_rounded,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  SizedBox(
                                     height: 40.h,
                                    child: IconInputForm(
                                      prefixIcon: Icons.lock_rounded,
                                      labelText: 'Confirm Password',
                                      controller: _confirmpassController,
                                      suffixIcon: Icons.visibility_off_rounded,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  
                                  MyButton(
                                    name: 'Sign Up',
                                    onPressed: () {
                                      context.go('/home');
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
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
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w300,
                                              color: appTertiary,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.go('/login');
                                            },
                                            child: Text(
                                              'Log-in',
                                              style: TextStyle(
                                                fontSize: 11.sp,
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
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/images/bottomLogin.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
