import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Api/user_api.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:provider/provider.dart';

class CaretakersList extends StatefulWidget {
  const CaretakersList({super.key});

  @override
  State<CaretakersList> createState() => _CaretakersListState();
}

class _CaretakersListState extends State<CaretakersList> {
  // controllers
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  // variables
  List<dynamic> caretakers = [];

  // user
  dynamic currentUser;

  // functions
  Future<void> getCaretakers() async {
    final res = await UserApi.getCaretakers();
    setState(() {
      caretakers = res;
    });
  }

  void clearControllers() {
    _userNameController.clear();
    _fNameController.clear();
    _lNameController.clear();
    _phoneController.clear();
    _passController.clear();
    _confirmPassController.clear();
  }

  void showCaretakerModal(bool editMode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReusableDialogBox(
          title: '${editMode ? 'Edit' : 'Add'} Caretaker',
          description:
              'Fill up the form to ${editMode ? 'update' : 'add'} a caretaker to your farm.',
          formFields: [
            RecyclableTextFormField(
              controller: _userNameController,
              readOnly: editMode,
              enabled: !editMode,
              labelText: 'Username',
              hintText: 'Username',
              hintTextSize: 14.sp,
              icon: Icons.person,
              textSize: 14.sp,
            ),
            RecyclableTextFormField(
              controller: _fNameController,
              labelText: 'First Name',
              hintText: 'First Name',
              hintTextSize: 14.sp,
              icon: Icons.person,
              textSize: 14.sp,
            ),
            RecyclableTextFormField(
              controller: _lNameController,
              labelText: 'Last Name',
              hintText: 'Last Name',
              hintTextSize: 14.sp,
              icon: Icons.person,
              textSize: 14.sp,
            ),
            RecyclableTextFormField(
              controller: _phoneController,
              labelText: 'Phone Number',
              hintText: 'Phone Number',
              maxLength: 11,
              hintTextSize: 14.sp,
              icon: Icons.phone,
              textSize: 14.sp,
            ),
            RecyclableTextFormField(
              controller: _passController,
              labelText: 'Password',
              hintText: 'Password',
              hintTextSize: 14.sp,
              icon: Icons.lock,
              textSize: 14.sp,
            ),
            RecyclableTextFormField(
              controller: _confirmPassController,
              labelText: 'Confirm Password',
              hintText: 'Confirm Password',
              hintTextSize: 14.sp,
              icon: Icons.lock,
              textSize: 14.sp,
            ),
          ],
          onSave: () async {
            try {
              if (_passController.text != '' &&
                  _confirmPassController.text != _passController.text) {
                throw 'Password does not match';
              }

              if (_phoneController.text.length != 11) {
                throw 'Phone number is invalid';
              }

              if (!editMode) {
                final newCaretaker = await UserApi.addCaretaker(
                    _userNameController.text,
                    _phoneController.text,
                    _fNameController.text,
                    _lNameController.text,
                    _passController.text);

                print(newCaretaker);
              } else {
                await UserApi.updateCaretaker(
                    _userNameController.text,
                    _phoneController.text,
                    _fNameController.text,
                    _lNameController.text,
                    _passController.text);
              }
              await getCaretakers();
              clearControllers();
              Navigator.of(context).pop();
            } catch (err) {
              ToastService().showErrorToast(err.toString());
            }
          },
          saveButtonText: editMode ? 'Update' : 'Add',
          saveButtonColor: appPrimary,
        );
      },
    );
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      currentUser = user;
      getCaretakers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var caretaker in caretakers)
          InkWell(
            onTap: () {
              if (currentUser != null && currentUser['role_id'] != 3) {
                return;
              }
              _userNameController.text = caretaker['username'] ?? '';
              _fNameController.text = caretaker['first_name'] ?? '';
              _lNameController.text = caretaker['last_name'] ?? '';
              _phoneController.text = caretaker['phone_number'] ?? '';
              _passController.clear();
              _confirmPassController.clear();
              showCaretakerModal(true);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      caretaker['profile_pic'] ?? 'assets/icons/Farmer.png',
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '${caretaker['first_name']!} ${caretaker['last_name']!}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: appPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    caretaker['phone_number'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: appTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (currentUser != null && currentUser['role_id'] == 3)
              InkWell(
                onTap: () {
                  clearControllers();
                  showCaretakerModal(false);
                },
                child: Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: appPrimary,
                  ),
                  child: Center(
                    child: Text(
                      'Add Caretaker',
                      style: TextStyle(
                        color: appSecondary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
