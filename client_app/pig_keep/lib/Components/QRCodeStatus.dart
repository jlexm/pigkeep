import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/PigList.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Screens/Records.dart';

class QRCodeStatus extends StatefulWidget {
  final Map<String, String> pigData;

  const QRCodeStatus({super.key, required this.pigData});

  @override
  State<QRCodeStatus> createState() => _QRCodeStatusState();
}

class _QRCodeStatusState extends State<QRCodeStatus> {
  late String pigStatus;

  @override
  void initState() {
    super.initState();
    pigStatus = widget.pigData['status'] ?? 'Alive';
  }

  void _navigateToRecords(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Records()),
    );
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
                borderRadius: BorderRadius.only(
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
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                isSelected: pigStatus == 'deceased',
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 135.h,
                child: Text(
                  widget.pigData['number'] ?? '--',
                  style: TextStyle(
                    fontSize: 100.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Pig Number',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: appPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                _DetailRow(
                    label: 'Date of Birth: ',
                    value: widget.pigData['dateofbirth'] ?? '--'),
                _DetailRow(
                    label: 'Age: ', value: widget.pigData['age'] ?? '--'),
                _DetailRow(
                    label: 'Age Category: ',
                    value: widget.pigData['category'] ?? '--'),
                _DetailRow(
                    label: 'Sex: ', value: widget.pigData['sex'] ?? '--'),
                _DetailRow(
                    label: 'Parent Number: ',
                    value: widget.pigData['parentnumber'] ?? '--'),
                _DetailRow(
                    label: 'Current Feed: ',
                    value: widget.pigData['feed'] ?? '--'),
                _DetailRow(
                  label: 'Pigpen Number: ',
                  value: widget.pigData['pen'] != null
                      ? 'P-${widget.pigData['pen']}'
                      : '--',
                ),
                Row(
                  children: [
                    _DetailRow(
                        label: 'Recorded Weight(Kg): ',
                        value: '${widget.pigData['weight'] ?? '--'} '),
                    Spacer(),
                    _DetailRow(
                        label: 'Date: ',
                        value: '${widget.pigData['weightdate'] ?? '--'} '),
                  ],
                ),
                Row(
                  children: [
                    _DetailRow(
                        label: 'Price Sold: ',
                        value: '${widget.pigData['priceSold'] ?? '--'} '),
                    Spacer(),
                    _DetailRow(
                        label: 'Date: ',
                        value: '${widget.pigData['selldate'] ?? '--'} '),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 26.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              _ActionButton(
                text: 'Return',
                color: Colors.transparent,
                borderColor: appTertiary,
                textColor: Colors.black,
                onTap: () {
                  _navigateToRecords(context);
                },
              ),
              Spacer(),
              if (pigStatus == 'alive') ...[
                _ActionButton(
                  text: 'Update',
                  color: Colors.transparent,
                  borderColor: appBlue,
                  textColor: appBlue,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReusableDialogBox(
                          title: 'Edit Pig ${widget.pigData['number']}',
                          description:
                              'Fill up the form to update the pig’s \ninformation.',
                          formFields: [
                            RecyclableTextFormField(
                              controller: TextEditingController(),
                              labelText: 'Date of Birth',
                              hintText: 'Date of Birth',
                              hintTextSize: 14.sp,
                              icon: Icons.email,
                              textSize: 14.sp,
                              height: 43.h,
                            ),
                            RecyclableTextFormField(
                              controller: TextEditingController(),
                              labelText: 'Sex',
                              showDropdown: true,
                              dropdownItems: ['Male', 'Female'],
                              hintText: 'Sex',
                              hintTextSize: 14.sp,
                              icon: Icons.email,
                              textSize: 14.sp,
                              height: 43.h,
                            ),
                            RecyclableTextFormField(
                              controller: TextEditingController(),
                              labelText: 'Parent Number',
                              hintText: 'Parent Number',
                              hintTextSize: 14.sp,
                              icon: Icons.email,
                              textSize: 14.sp,
                              height: 43.h,
                            ),
                            RecyclableTextFormField(
                              controller: TextEditingController(),
                              labelText: 'Pen Number',
                              showDropdown: true,
                              dropdownItems: [
                                'PenNumber 1 Link this',
                                'PenNumber 2 Link this',
                                'PenNumber 3 Link this',
                              ],
                              hintText: 'Pen Number',
                              hintTextSize: 14.sp,
                              icon: Icons.email,
                              textSize: 14.sp,
                              height: 43.h,
                            ),
                            RecyclableTextFormField(
                              controller: TextEditingController(),
                              labelText: 'Weight in kg',
                              hintText: 'Weight in kg',
                              hintTextSize: 14.sp,
                              icon: Icons.email,
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
                SizedBox(width: 5.w),
                _ActionButton(
                  text: 'QR Code',
                  color: appOrange,
                  borderColor: appOrange,
                  textColor: appSecondary,
                  icon: Icons.download,
                  onTap: () {},
                  width: 103.w,
                ),
              ],
              SizedBox(width: 20.w),
            ],
          ),
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
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _DetailRow({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
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
