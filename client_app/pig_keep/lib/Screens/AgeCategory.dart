import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Api/user_api.dart';
import 'package:pig_keep/Components/Greenbtn.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/MyUsernameField.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:provider/provider.dart';

class Agecategory extends StatefulWidget {
  const Agecategory({super.key});

  @override
  State<Agecategory> createState() => _AgecategoryState();
}

void _saveProfile() {}

class _AgecategoryState extends State<Agecategory> {
  final TextEditingController _oldpasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  dynamic currentUser;
  bool isFormEditable = false;

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      currentUser = user;
      isFormEditable = currentUser != null && currentUser['role_id'] == 3;
    });
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Age Category',
                          style: TextStyle(
                            color: appTertiary,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Set your preferred age category for your pigs',
                          style: TextStyle(
                            color: appTertiary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
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
                            controller: _oldpasswordController,
                            obscureText: true,
                            labelText: 'Piglet',
                            icon: Icons.savings,
                            textSize: 14.sp,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            controller: _oldpasswordController,
                            obscureText: true,
                            labelText: 'Weaner',
                            icon: Icons.savings,
                            textSize: 14.sp,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            controller: _oldpasswordController,
                            obscureText: true,
                            labelText: 'Grower',
                            icon: Icons.savings,
                            textSize: 14.sp,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            controller: _oldpasswordController,
                            obscureText: true,
                            labelText: 'Matured',
                            icon: Icons.savings,
                            textSize: 14.sp,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            controller: _oldpasswordController,
                            obscureText: true,
                            labelText: 'Finisher',
                            icon: Icons.savings,
                            textSize: 14.sp,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          MyGreenBtn(
                            name: "Save",
                            onPressed: () {
                              if (!isFormEditable) {
                                ToastService().showWarningToast(
                                    'Only owners can edit this');
                                return;
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
