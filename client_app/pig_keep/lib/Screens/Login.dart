import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Api/auth_api.dart';
import 'package:pig_keep/Components/IconInputForm.dart';
import 'package:pig_keep/Components/ImageInputForm.dart';
import 'package:pig_keep/Components/myButton.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Store/auth_storage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoginAPILoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isChecked = false;

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
                  height: 200.h,
                ),
                const Row(
                  children: [
                    Text(
                      'Log in',
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
                const Column(
                  children: [
                    Text(
                      'Welcome back! Log in to your account to continue your pig farm management experience.',
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
                  prefixIcon: Icons.lock_rounded,
                  labelText: 'Password',
                  controller: _passController,
                  suffixIcon: Icons.visibility_off_rounded,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: appPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  name: 'Login',
                  onPressed: () async {
                    if (isLoginAPILoading) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('API is still loading.'),
                        ),
                      );
                      return;
                    }
                    try {
                      isLoginAPILoading = true;
                      // call login api and store to body variable
                      final body = await AuthApi.login(
                          _usernameController.text, _passController.text);

                      // update localStorage token that was rcved from login api
                      await AuthStorage.updateToken(body['token']);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          context.go('/home');
                        }
                      });
                    } catch (e) {
                      // Handle the error properly here, e.g., show an error message
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: Colors.red,
                          ),
                        );
                      });
                    } finally {
                      // set loading state to false.
                      isLoginAPILoading = false;
                    }
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
                          'Don\'t have an account? ',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go('/sign-up');
                          },
                          child: Text(
                            'Sign-Up',
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
