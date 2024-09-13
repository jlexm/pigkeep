import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Api/farm_api.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/navigation-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:provider/provider.dart';

class FarmName extends StatefulWidget {
  const FarmName({super.key});

  @override
  _FarmNameState createState() => _FarmNameState();
}

class _FarmNameState extends State<FarmName> {
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

  String? _selectedValue;
  List<String> _farmNames = [];

  void _addNewFarm() {
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
              height: 43.h,
            ),
            RecyclableTextFormField(
              controller: farmAddressController,
              labelText: 'Address',
              hintText: 'Address',
              hintTextSize: 14.sp,
              icon: Icons.location_on,
              textSize: 14.sp,
              height: 43.h,
            ),
          ],
          onSave: () {
            // Handle the save action, e.g., validate and save data
            createFarm(farmNameController.text, farmAddressController.text);
          },
          saveButtonText: 'Add',
          saveButtonColor: appPrimary,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _farmNames = context
        .watch<GlobalProvider>()
        .getFarms()
        .map((farm) => farm.farmName)
        .toList();
    _selectedValue = context.watch<GlobalProvider>().getSelectedFarm();

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
                child: DropdownButton<String>(
                  value: _farmNames.contains(_selectedValue)
                      ? _selectedValue
                      : null,
                  isExpanded: true,
                  items: _farmNames.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          value,
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
                      DropdownMenuItem<String>(
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
                  onChanged: (String? newValue) {
                    if (newValue == null) {
                      _addNewFarm();
                    } else {
                      context.read<GlobalProvider>().setSelectedFarm(newValue);
                    }
                  },
                  underline: const SizedBox(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: appPrimary,
                  ),
                  selectedItemBuilder: (BuildContext context) {
                    return _farmNames.map((String value) {
                      return Text(
                        value,
                        style: TextStyle(
                          fontSize: value == _selectedValue ? 24.sp : 14.sp,
                          fontWeight: value == _selectedValue
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
