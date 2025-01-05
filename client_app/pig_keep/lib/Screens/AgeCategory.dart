import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Api/user_api.dart';
import 'package:pig_keep/Components/Greenbtn.dart';
import 'package:pig_keep/Components/Hamburger.dart';
import 'package:pig_keep/Components/MyUsernameField.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/network-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:provider/provider.dart';

class Agecategory extends StatefulWidget {
  const Agecategory({super.key});

  @override
  State<Agecategory> createState() => _AgecategoryState();
}

void _saveProfile() {}

class _AgecategoryState extends State<Agecategory> {
  // CONTROLLERS
  final TextEditingController _pigletDaysController = TextEditingController();
  final TextEditingController _weanerDaysController = TextEditingController();
  final TextEditingController _growerDaysController = TextEditingController();
  final TextEditingController _maturedDaysController = TextEditingController();

  // VARS
  dynamic currentUser;
  bool isFormEditable = false;

  // FUNCTIONS
  Future<void> loadPigAgeCategoriesData() async {
    dynamic ageSettings = GlobalProvider.getUserAgeCategorySettings();
    if (await NetworkService.checkInternetConnection()) {
      ageSettings = await UserApi.getUserAgeCategorySettings();
    }
    print(ageSettings);
    int pigletDays = 35;
    int weanerDays = 80;
    int growerDays = 123;
    int maturedDays = 182;
    if (ageSettings != null) {
      if (ageSettings['piglet'] != null) {
        pigletDays = ageSettings['piglet'];
      }
      if (ageSettings['weaner'] != null) {
        weanerDays = ageSettings['weaner'];
      }
      if (ageSettings['grower'] != null) {
        growerDays = ageSettings['grower'];
      }
      if (ageSettings['matured'] != null) {
        maturedDays = ageSettings['matured'];
      }
    }
    _pigletDaysController.text = pigletDays.toString();
    _weanerDaysController.text = weanerDays.toString();
    _growerDaysController.text = growerDays.toString();
    _maturedDaysController.text = maturedDays.toString();
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      currentUser = user;
      isFormEditable = currentUser != null && currentUser['role_id'] == 3;
      loadPigAgeCategoriesData();
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
                            controller: _pigletDaysController,
                            labelText: 'Piglet Days (default: 35)',
                            icon: Icons.savings,
                            textSize: 14.sp,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            controller: _weanerDaysController,
                            labelText: 'Weaner Days (default: 80)',
                            icon: Icons.savings,
                            textSize: 14.sp,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            controller: _growerDaysController,
                            labelText: 'Grower Days (default: 123)',
                            icon: Icons.savings,
                            textSize: 14.sp,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RecyclableTextFormField(
                            controller: _maturedDaysController,
                            labelText: 'Matured Days (default: 182)',
                            icon: Icons.savings,
                            textSize: 14.sp,
                            keyboardType: TextInputType.number,
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
                              if (!isFormEditable) {
                                ToastService().showWarningToast(
                                    'Only owners can edit this');
                                return;
                              }
                              try {
                                await UserApi.updateUserAgeCategorySettings(
                                    int.parse(_pigletDaysController.text),
                                    int.parse(_weanerDaysController.text),
                                    int.parse(_growerDaysController.text),
                                    int.parse(_maturedDaysController.text));
                                await loadPigAgeCategoriesData();
                                ToastService().showSuccessToast(
                                    'Pig Age Category updated!');
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
