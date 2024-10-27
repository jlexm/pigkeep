import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Modals/QRCodeDownload.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/ledger.service.dart';
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PigView extends StatefulWidget {
  final String pigUUID;

  const PigView({super.key, required this.pigUUID});

  @override
  State<PigView> createState() => _QRCodeStatusState();
}

class _QRCodeStatusState extends State<PigView> {
  // services
  final penService = globalLocator.get<PigPenService>();
  final pigService = globalLocator.get<PigService>();
  final ledgerService = globalLocator.get<LedgerService>();

  var selectedFarm;
  late String userOwner;
  String pigStatus = "Alive";
  Map<String, dynamic> pigData = {};
  List<PigPen> pigPens = [];

  // edit pig controllers
  final TextEditingController _pigDOBController = TextEditingController();
  final TextEditingController _pigSexController = TextEditingController();
  final TextEditingController _pigPenNumberController = TextEditingController();
  final TextEditingController _pigWeightKGController = TextEditingController();
  final TextEditingController _pigNumberController = TextEditingController();

  // sell controllers
  final TextEditingController _priceController = TextEditingController();

  // var

  List<Map<String, dynamic>> pigs = [];

  // functions
  Future<void> getPigDetails() async {
    if (!mounted) return;
    final pig = await pigService.fetchPigDetails(widget.pigUUID);

    setState(() {
      // load pigData
      pigData = pig;
      pigStatus = pigData['status'] ?? 'Alive';

      //update pig update controllers
      _pigDOBController.text = pigData['dob'].toString().split(' ')[0];
      _pigSexController.text = pigData['sex'] ? 'Male' : 'Female';
      //_pigParentPigNumberController.text
      _pigPenNumberController.text = pigData['penUuid'];
      _pigWeightKGController.text =
          pigData['weightKG'] != null ? pigData['weightKG'].toString() : '';
    });
  }

  Future<void> getPigPens() async {
    final fetchPens =
        await penService.fetchPigPens(selectedFarm['_id'], userOwner);
    setState(() {
      pigPens = fetchPens;
    });
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      selectedFarm = context.read<GlobalProvider>().getSelectedFarm();
      userOwner = user['username'];
      getPigDetails();
      getPigPens();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final farm = context.watch<GlobalProvider>().getSelectedFarm();
    // Use post frame callback for navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Navigate only if the selectedFarm is not null
      if (selectedFarm != null) {
        context.go('/records/pigs'); // Perform navigation
      }
    });
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
                      borderColor: appPurple,
                      textColor: appPurple,
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
                                  controller: _pigWeightKGController,
                                  labelText: 'Weight in kg',
                                  hintText: 'Weight in kg',
                                  hintTextSize: 14.sp,
                                  icon: Icons.scale,
                                  textSize: 14.sp,
                                  height: 43.h,
                                  keyboardType: TextInputType.phone,
                                ),
                                RecyclableTextFormField(
                                  controller: _priceController,
                                  labelText: 'Price',
                                  hintText: 'Price',
                                  hintTextSize: 14.sp,
                                  icon: Icons.php,
                                  textSize: 14.sp,
                                  height: 43.h,
                                  keyboardType: TextInputType.phone,
                                ),
                              ],
                              onSave: () async {
                                // Handle the save action, e.g., validate and save data
                                print('Form saved');
                                try {
                                  await ledgerService.ledgePig(
                                      'sold',
                                      userOwner,
                                      selectedFarm['_id'],
                                      pigData['uuid'],
                                      pigData['penUuid'],
                                      _priceController.text.isNotEmpty
                                          ? double.parse(_priceController.text)
                                          : 0,
                                      _pigWeightKGController.text.isNotEmpty
                                          ? double.parse(
                                              _pigWeightKGController.text)
                                          : 0);
                                  await getPigDetails();
                                } catch (err) {
                                  ToastService().showErrorToast(err.toString());
                                }
                                Navigator.of(context).pop();
                              },
                              saveButtonText: 'Sell Pig',
                              saveButtonColor: appPurple,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 5.h),
                    _ActionButton(
                      text: 'Decease',
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
                              onSave: () async {
                                // Handle the save action, e.g., validate and save data
                                print('Form saved');
                                try {
                                  await ledgerService.ledgePig(
                                      'deceased',
                                      userOwner,
                                      selectedFarm['_id'],
                                      pigData['uuid'],
                                      pigData['penUuid'],
                                      _priceController.text.isNotEmpty
                                          ? double.parse(_priceController.text)
                                          : 0,
                                      _pigWeightKGController.text.isNotEmpty
                                          ? double.parse(
                                              _pigWeightKGController.text)
                                          : 0);
                                  await getPigDetails();
                                } catch (err) {
                                  ToastService().showErrorToast(err.toString());
                                }
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
                              title: 'Consume Medicine',
                              description: 'Fill up the necessary information.',
                              formFields: [
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Medicine Name',
                                  showDropdown: true,
                                  dropdownItems: [
                                    CustomDropDownItem('Med 1', 'Med 1'),
                                    CustomDropDownItem('Med 2', 'Med 2'),
                                    CustomDropDownItem('Med 3', 'Med 3')
                                  ],
                                  hintText: 'Medicine Name',
                                  hintTextSize: 14.sp,
                                  icon: Icons.medical_services,
                                  textSize: 14.sp,
                                  height: 43.h,
                                ),
                                RecyclableTextFormField(
                                  controller: TextEditingController(),
                                  labelText: 'Quantity',
                                  hintText: 'Quantity',
                                  hintTextSize: 14.sp,
                                  icon: Icons.numbers,
                                  textSize: 14.sp,
                                  height: 43.h,
                                  keyboardType: TextInputType.phone,
                                ),
                                RecyclableTextFormField(
                                  controller: _pigNumberController,
                                  labelText: 'Pig Number',
                                  showDropdown: true,
                                  dropdownItems: pigs
                                      .where((pig) => pig['status'] == 'alive')
                                      .map((pig) => CustomDropDownItem(
                                          pig['uuid'],
                                          'Pig: ${pig['pigNumber']} | ${pig['ageCategory']}'))
                                      .toList(),
                                  hintText: 'Pig Number',
                                  hintTextSize: 14.sp,
                                  icon: Icons.savings,
                                  textSize: 14.sp,
                                  height: 43.h,
                                  readOnly: true,
                                ),
                              ],
                              onSave: () {
                                // Handle the save action, e.g., validate and save data
                                print('Form saved');
                                Navigator.of(context).pop();
                              },
                              saveButtonText: 'Consume',
                              saveButtonColor: appRed,
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
                          pigNumber: pigData['pigNumber'],
                          uuid: pigData['uuid'], //QR code
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
                            controller: _pigSexController,
                            labelText: 'Sex',
                            showDropdown: true,
                            dropdownItems: [
                              CustomDropDownItem('Male', 'Male'),
                              CustomDropDownItem('Female', 'Female')
                            ],
                            readOnly: true,
                            hintText: 'Sex',
                            hintTextSize: 14.sp,
                            icon: Icons.male,
                            textSize: 14.sp,
                            height: 43.h,
                          ),
                          RecyclableTextFormField(
                            controller: _pigPenNumberController,
                            labelText: 'Pen Number',
                            showDropdown: true,
                            dropdownItems: pigPens
                                .map((pen) => CustomDropDownItem(pen.uuid,
                                    '${pen.penNumber} - ${pen.penType}'))
                                .toList(),
                            hintText: 'Pen Number',
                            hintTextSize: 14.sp,
                            icon: Icons.numbers,
                            textSize: 14.sp,
                            height: 43.h,
                            readOnly: true,
                          ),
                          RecyclableTextFormField(
                            controller: _pigWeightKGController,
                            labelText: 'Weight in kg',
                            hintText: 'Weight in kg',
                            hintTextSize: 14.sp,
                            icon: Icons.scale,
                            textSize: 14.sp,
                            height: 43.h,
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                        onSave: () async {
                          // Handle the save action, e.g., validate and save data
                          print('Form saved');
                          print(_pigWeightKGController.text.isNotEmpty
                              ? double.parse(_pigWeightKGController.text)
                              : null);
                          try {
                            await pigService.updatePigDetails(
                                widget.pigUUID,
                                _pigPenNumberController.text,
                                _pigSexController.text == 'Male',
                                DateTime.parse(_pigDOBController.text),
                                _pigWeightKGController.text.isNotEmpty
                                    ? double.parse(_pigWeightKGController.text)
                                    : null);
                            await getPigDetails();
                          } catch (err) {
                            ToastService().showErrorToast(err.toString());
                          }
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
                        ? pigData['dob'].toString().split(' ')[0]
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
                    value: pigData['parentPigNumber'] ?? '--'),
                _DetailRow(
                    label: 'Current Feed: ',
                    value: pigData['currentFeed'] ?? '--'),
                _DetailRow(
                  label: 'Pen Number: ',
                  value: pigData['penNumber'] ?? '--',
                ),
                Row(
                  children: [
                    _DetailRow(
                        label: 'Recorded Weight(Kg): ',
                        value:
                            '${pigData['weightKG'] != null ? pigData['weightKG'].toString() : '--'} '),
                    const Spacer(),
                    _DetailRow(
                        label: 'Date: ',
                        value:
                            '${pigData['lastWeightRecorded'] != null ? pigData['lastWeightRecorded'].toString().split(' ')[0] : '--'} '),
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
                        value:
                            '${pigData['transactionDate'] != null ? pigData['transactionDate'].toString().split(' ')[0] : '--'} '),
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
