import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Api/farm_api.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/navigation-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/Store/auth_storage.dart';
import 'package:provider/provider.dart';

class FarmName extends StatefulWidget {
  const FarmName({super.key});

  @override
  _FarmNameState createState() => _FarmNameState();
}

class _FarmNameState extends State<FarmName> {
  //variable
  dynamic currentUser;

  void createFarm(String farmName, String farmAdress) async {
    try {
      await FarmApi.createFarm(farmName, farmAdress);
      await context.read<GlobalProvider>().fetchFarms();
      ToastService().showSuccessToast('Farm successfully created!');
      context.pop();
      navigationService.replaceTo('/home');
    } catch (err) {
      ToastService().showErrorToast(err.toString());
    }
  }

  List<Map<String, dynamic>> _farms = [];

  void _addNewFarm() {
    if (currentUser != null && currentUser['role_id'] != 3) {
      ToastService().showWarningToast('Only owner can add new farm');
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final farmNameController = TextEditingController(text: '');
        final farmAddressController = TextEditingController(text: '');

        return ReusableDialogBox(
          title: 'Add Farm',
          description: 'Fill up the form to add a pig farm',
          formFields: [
            RecyclableTextFormField(
              controller: farmNameController,
              labelText: 'Farm Name',
              hintText: 'Farm Name',
              hintTextSize: 14.sp,
              icon: Icons.house_siding_rounded,
              textSize: 14.sp,
            ),
            RecyclableTextFormField(
              controller: farmAddressController,
              labelText: 'Address',
              hintText: 'Address',
              hintTextSize: 14.sp,
              icon: Icons.location_on,
              textSize: 14.sp,
            ),
          ],
          onSave: () {
            createFarm(farmNameController.text, farmAddressController.text);
          },
          saveButtonText: 'Add',
          saveButtonColor: appPrimary,
        );
      },
    );
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      currentUser = user;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _farms = context.watch<GlobalProvider>().getFarms();

    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        top: 5.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.w,
                child: DropdownButton<Map<String, dynamic>>(
                  value: _farms.isEmpty
                      ? null
                      : _farms.firstWhere(
                          (f) => f['is_selected'] != null && f['is_selected']),
                  isExpanded: true,
                  items: _farms.map((farm) {
                    return DropdownMenuItem<Map<String, dynamic>>(
                      value: farm,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          farm['farm_name'],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: appTertiary,
                          ),
                        ),
                      ),
                    );
                  }).toList()
                    ..add(
                      DropdownMenuItem<Map<String, dynamic>>(
                        value: null,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/Add.png',
                                color: appPrimary,
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Add New Farm',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: appPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  onChanged: (farm) {
                    if (farm == null) {
                      _addNewFarm();
                    } else {
                      context.read<GlobalProvider>().setSelectedFarm(farm);
                    }
                  },
                  underline: const SizedBox(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: appPrimary,
                  ),
                  selectedItemBuilder: (BuildContext context) {
                    return _farms.map((farm) {
                      return Text(
                        farm['farm_name'],
                        style: TextStyle(
                          fontSize:
                              farm['is_selected'] != null && farm['is_selected']
                                  ? 24.sp
                                  : 14.sp,
                          fontWeight:
                              farm['is_selected'] != null && farm['is_selected']
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                          color: appTertiary,
                        ),
                      );
                    }).toList()
                      ..add(
                        Text(
                          'Add New Farm',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: appPrimary,
                          ),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
