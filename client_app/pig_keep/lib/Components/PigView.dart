import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Modals/QRCodeDownload.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PigView extends StatefulWidget {
  final String pigUUID;

  const PigView({super.key, required this.pigUUID});

  @override
  State<PigView> createState() => _QRCodeStatusState();
}

class _QRCodeStatusState extends State<PigView> {
  // services
  final pigService = globalLocator.get<PigService>();

  String pigStatus = "Alive";
  final TextEditingController _pigDOBController = TextEditingController();
  Map<String, dynamic> pigData = {};

  // functions
  Future<void> getPigDetails() async {
    final pig = await pigService.fetchPigDetails(widget.pigUUID);

    setState(() {
      pigData = pig;
      pigStatus = pigData['status'] ?? 'Alive';
      //update dob
      _pigDOBController.text = pigData['dob'].toString();
    });
  }

  @override
  void initState() {
    // fetch pig details
    getPigDetails();
    super.initState();
  }

  /*  void _navigateToRecords(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const Records()),
    );
  } */

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _pigDOBController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatusContainer(
                text: 'Alive',
                color: pigStatus == 'alive' ? appBlue : appSecondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                isSelected: pigStatus == 'alive',
              ),
              _StatusContainer(
                text: 'Sold',
                color: pigStatus == 'sold' ? appPrimary : appSecondary,
                borderRadius: BorderRadius.zero,
                isSelected: pigStatus == 'sold',
              ),
              _StatusContainer(
                text: 'Deceased',
                color: pigStatus == 'deceased' ? appRed : appSecondary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                isSelected: pigStatus == 'deceased',
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 155.h,
                child: QrImageView(
                    data: 'pigkeep:${pigData['pigNumber']}:${pigData['uuid']}',
                    version: QrVersions.auto),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (pigStatus == 'alive') ...[
                    Text(
                      pigData['pigNumber'] ?? '--',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: appPrimary,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    _ActionButton(
                      text: 'Sell',
                      color: Colors.transparent,
                      width: 100.w,
                      borderColor: appPrimary,
                      textColor: appPrimary,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReusableDialogBox(
                              title: 'Sell Pig',
                              description: 'Fill up the necessary information.',
                              formFields: [
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: pigData['pigNumber'],
                                  hintText: 'Pig Number',
                                  hintTextSize: 14.sp,
                                  icon: Icons.savings,
                                  textSize: 14.sp,
                                  height: 43.h,
                                  readOnly: true,
                                  enabled: false,
                                ),
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Weight in kg',
                                  hintText: 'Weight in kg',
                                  hintTextSize: 14.sp,
                                  icon: Icons.scale,
                                  textSize: 14.sp,
                                  height: 43.h,
                                ),
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Price',
                                  hintText: 'Price',
                                  hintTextSize: 14.sp,
                                  icon: Icons.php,
                                  textSize: 14.sp,
                                  height: 43.h,
                                ),
                              ],
                              onSave: () {
                                // Handle the save action, e.g., validate and save data
                                print('Form saved');
                                Navigator.of(context).pop();
                              },
                              saveButtonText: 'Sell Pig',
                              saveButtonColor: appPrimary,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 5.h),
                    _ActionButton(
                      text: 'Deceased',
                      color: Colors.transparent,
                      borderColor: appRed,
                      textColor: appRed,
                      width: 100.w,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReusableDialogBox(
                              title: 'Deceased Pig',
                              description: 'Fill up the necessary information.',
                              formFields: [
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: pigData['pigNumber'],
                                  hintText: 'Pig Number',
                                  hintTextSize: 14.sp,
                                  icon: Icons.savings,
                                  textSize: 14.sp,
                                  height: 43.h,
                                  readOnly: true,
                                  enabled: false,
                                ),
                              ],
                              onSave: () {
                                // Handle the save action, e.g., validate and save data
                                print('Form saved');
                                Navigator.of(context).pop();
                              },
                              saveButtonText: 'Remove',
                              saveButtonColor: appRed,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 5.h),
                    _ActionButton(
                      text: 'Medicine',
                      color: Colors.transparent,
                      width: 100.w,
                      borderColor: appBlue,
                      textColor: appBlue,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReusableDialogBox(
                              title: 'Edit Pig ${pigData['pigNumber']}',
                              description: '',
                              formFields: [
                                RecyclableTextFormField(
                                  controller: _pigDOBController,
                                  keyboardType: TextInputType.datetime,
                                  labelText: 'Date of Birth',
                                  hintText: 'YYYY/MM/DD',
                                  hintTextSize: 14.sp,
                                  icon: Icons.calendar_month,
                                  textSize: 14.sp,
                                  height: 43.h,
                                  onTap: () {
                                    _selectDate();
                                  },
                                  readOnly: true,
                                ),
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Sex',
                                  showDropdown: true,
                                  dropdownItems: [
                                    CustomDropDownItem('Male', 'Male'),
                                    CustomDropDownItem('Female', 'Female')
                                  ],
                                  hintText: 'Sex',
                                  hintTextSize: 14.sp,
                                  icon: Icons.male,
                                  textSize: 14.sp,
                                  height: 43.h,
                                ),
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Parent Number',
                                  hintText: 'Parent Number',
                                  hintTextSize: 14.sp,
                                  icon: Icons.savings,
                                  textSize: 14.sp,
                                  height: 43.h,
                                ),
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Pen Number',
                                  showDropdown: true,
                                  dropdownItems: [
                                    CustomDropDownItem('Pen1', 'Pen1')
                                  ],
                                  hintText: 'Pen Number',
                                  hintTextSize: 14.sp,
                                  icon: Icons.numbers,
                                  textSize: 14.sp,
                                  height: 43.h,
                                ),
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Weight in kg',
                                  hintText: 'Weight in kg',
                                  hintTextSize: 14.sp,
                                  icon: Icons.scale,
                                  textSize: 14.sp,
                                  height: 43.h,
                                ),
                              ],
                              onSave: () {
                                // Handle the save action, e.g., validate and save data
                                print('Form saved');
                                Navigator.of(context).pop();
                              },
                              saveButtonText: 'Save',
                              saveButtonColor: appBlue,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: _ActionButton(
                  text: 'QR Code',
                  color: appOrange,
                  borderColor: appOrange,
                  textColor: appSecondary,
                  icon: Icons.download,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return QRCodeDownload(
                          title: 'Download QR Code',
                          saveButtonText: 'QR Code',
                          saveButtonIcon: Icons.download,
                          saveButtonColor: appOrange,
                          number: int.parse(pigData['number'] ?? '0'),
                          imagePath: 'assets/images/qrsample.png', //QR code
                          onSave: () {
                            // Perform your save action here
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                  width: 103.w,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              _ActionButton(
                text: 'Update',
                color: Colors.transparent,
                width: 100.w,
                borderColor: appTertiary,
                textColor: appTertiary,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ReusableDialogBox(
                        title: 'Edit Pig ${pigData['pigNumber']}',
                        description: '',
                        formFields: [
                          RecyclableTextFormField(
                            controller: _pigDOBController,
                            keyboardType: TextInputType.datetime,
                            labelText: 'Date of Birth',
                            hintText: 'YYYY/MM/DD',
                            hintTextSize: 14.sp,
                            icon: Icons.calendar_month,
                            textSize: 14.sp,
                            height: 43.h,
                            onTap: () {
                              _selectDate();
                            },
                            readOnly: true,
                          ),
                          RecyclableTextFormField(
                            controller: TextEditingController(),
                            labelText: 'Sex',
                            showDropdown: true,
                            dropdownItems: [
                              CustomDropDownItem('Male', 'Male'),
                              CustomDropDownItem('Female', 'Female')
                            ],
                            hintText: 'Sex',
                            hintTextSize: 14.sp,
                            icon: Icons.male,
                            textSize: 14.sp,
                            height: 43.h,
                          ),
                          RecyclableTextFormField(
                            controller: TextEditingController(),
                            labelText: 'Parent Number',
                            hintText: 'Parent Number',
                            hintTextSize: 14.sp,
                            icon: Icons.savings,
                            textSize: 14.sp,
                            height: 43.h,
                          ),
                          RecyclableTextFormField(
                            controller: TextEditingController(),
                            labelText: 'Pen Number',
                            showDropdown: true,
                            dropdownItems: [CustomDropDownItem('Pen1', 'Pen1')],
                            hintText: 'Pen Number',
                            hintTextSize: 14.sp,
                            icon: Icons.numbers,
                            textSize: 14.sp,
                            height: 43.h,
                          ),
                          RecyclableTextFormField(
                            controller: TextEditingController(),
                            labelText: 'Weight in kg',
                            hintText: 'Weight in kg',
                            hintTextSize: 14.sp,
                            icon: Icons.scale,
                            textSize: 14.sp,
                            height: 43.h,
                          ),
                        ],
                        onSave: () {
                          // Handle the save action, e.g., validate and save data
                          print('Form saved');
                          Navigator.of(context).pop();
                        },
                        saveButtonText: 'Save',
                        saveButtonColor: appBlue,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                _DetailRow(
                    label: 'Date of Birth: ',
                    value: pigData['dob'] != null
                        ? pigData['dob'].toString()
                        : '--'),
                _DetailRow(label: 'Age: ', value: pigData['age'] ?? '--'),
                _DetailRow(
                    label: 'Age Category: ',
                    value: pigData['ageCategory'] ?? '--'),
                _DetailRow(
                    label: 'Sex: ',
                    value: pigData['sex'] == null
                        ? '--'
                        : pigData['sex']
                            ? 'Male'
                            : 'Female'),
                _DetailRow(
                    label: 'Parent Number: ',
                    value: pigData['parentnumber'] ?? '--'),
                _DetailRow(
                    label: 'Current Feed: ',
                    value: pigData['currentFeed'] ?? '--'),
                _DetailRow(
                  label: 'Pigpen Number: ',
                  value: pigData['penNumber'] ?? '--',
                ),
                Row(
                  children: [
                    _DetailRow(
                        label: 'Recorded Weight(Kg): ',
                        value: '${pigData['weight'] ?? '--'} '),
                    const Spacer(),
                    _DetailRow(
                        label: 'Date: ',
                        value: '${pigData['weightdate'] ?? '--'} '),
                  ],
                ),
                Row(
                  children: [
                    _DetailRow(
                        label: 'Price Sold: ',
                        value: '${pigData['priceSold'] ?? '--'} '),
                    const Spacer(),
                    _DetailRow(
                        label: 'Date: ',
                        value: '${pigData['selldate'] ?? '--'} '),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 26.h),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Widget for status containers
  Widget _StatusContainer({
    required String text,
    required Color color,
    required BorderRadius borderRadius,
    required bool isSelected,
  }) {
    return Container(
      height: 35.h,
      width: 83.w,
      decoration: BoxDecoration(
        border: Border.all(color: appTertiary, width: 1),
        color: color,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isSelected ? appSecondary : appTertiary,
          ),
        ),
      ),
    );
  }

  Widget _DetailRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: appPrimary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ActionButton({
    required String text,
    required Color color,
    required Color borderColor,
    required Color textColor,
    IconData? icon,
    required VoidCallback onTap,
    double? width,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.h,
        width: width ?? (icon == null ? 83.w : 95.w),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: textColor),
              if (icon != null) SizedBox(width: 5.w),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
