import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Api/auth_api.dart';
import 'package:pig_keep/Components/IconInputForm.dart';
import 'package:pig_keep/Components/ImageInputForm.dart';
import 'package:pig_keep/Components/myButton.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Services/navigation-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
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
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Log in',
                                        style: TextStyle(
                                            color: appTertiary,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 30.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Welcome back! Log in to your account to continue your pig farm management experience.',
                                        style: TextStyle(
                                          color: appTertiary,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                    child: ImageInputForm(
                                      labelText: 'Username',
                                      controller: _usernameController,
                                      prefixIcon: Image.asset(
                                        'assets/icons/Farmer.png',
                                        scale: 12.w,
                                      ),
                                      textStyle: TextStyle(
                                        fontSize: 14
                                            .sp, // Adjust the font size as needed
                                      ),
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
                                      obscureText: true,
                                      controller: _passController,
                                      suffixIcon: Icons.visibility_off_rounded,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          return await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                title: Text(
                                                  "Forgot your password?",
                                                  style: TextStyle(
                                                    fontSize: 25.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: appTertiary,
                                                  ),
                                                ),
                                                content: Text(
                                                  "Don't worry we got you covered. \nPlease contact us at pigkeepdevs@gmail.com!",
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: appTertiary,
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: appBlue,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Return',
                                                      style: TextStyle(
                                                        color: appSecondary,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w300,
                                            color: appTertiary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  MyButton(
                                    name: 'Login',
                                    onPressed: () async {
                                      if (isLoginAPILoading) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('API is still loading.'),
                                          ),
                                        );
                                        return;
                                      }
                                      try {
                                        isLoginAPILoading = true;
                                        // call login api and store to body variable
                                        final body = await AuthApi.login(
                                            _usernameController.text,
                                            _passController.text);

                                        print(body);

                                        // update localStorage token that was rcved from login api
                                        await AuthStorage.updateToken(
                                            body['token']);

                                        // update localStorage username that was rcved from login api
                                        await AuthStorage.setUser(jsonEncode({
                                          "username": body['username'],
                                          "first_name": body['first_name'],
                                          "last_name": body['last_name'],
                                          "role_id": body['role_id'],
                                          "profile_pic": body['profile_pic']
                                        }));

                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (mounted) {
                                            //context.go('/home');
                                            navigationService
                                                .replaceTo('/home');
                                          }
                                        });
                                      } catch (e) {
                                        // Handle the error properly here, e.g., show an error message

                                        ToastService()
                                            .showErrorToast(e.toString());
                                      }
                                      // set loading state to false.
                                      isLoginAPILoading = false;
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
                                            'Don\'t have an account? ',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w300,
                                              color: appTertiary,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.push('/sign-up');
                                            },
                                            child: Text(
                                              'Sign-Up',
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
