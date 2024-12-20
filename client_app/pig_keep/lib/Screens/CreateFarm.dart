import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Api/farm_api.dart';
import 'package:pig_keep/Components/Greenbtn.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Services/navigation-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:provider/provider.dart';

class Createfarm extends StatefulWidget {
  const Createfarm({super.key});

  @override
  State<Createfarm> createState() => _CreatefarmState();
}

class _CreatefarmState extends State<Createfarm> {
  void createFarm(String farmName, String farmAdress) async {
    try {
      await FarmApi.createFarm(farmName, farmAdress);
      await context.read<GlobalProvider>().fetchFarms();
      ToastService().showSuccessToast('Farm successfully created!');

      Future.delayed(Duration(seconds: 1), () {
        context.pop();
        navigationService.replaceTo('/home');
      });
    } catch (err) {
      ToastService().showErrorToast(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final farmNameController = TextEditingController(text: '');
    final farmAddressController = TextEditingController(text: '');

    return Scaffold(
      backgroundColor: appSecondary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.h,
              ),
              Text(
                'You do not have a pig farm to manage yet. \n Create a pig farm to begin your pig farm management experience.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 100.w,
                child: MyGreenBtn(
                  name: 'Create',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReusableDialogBox(
                          title: 'Farm Creation',
                          description: 'Enter the name of your pig farm.',
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
                            // Handle the save action, e.g., validate and save data
                            createFarm(farmNameController.text,
                                farmAddressController.text);
                          },
                          saveButtonText: 'Create',
                          saveButtonColor: appPrimary,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
