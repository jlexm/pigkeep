import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Components/Carousel_MedicalRecords.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/SearchBar_MedicalRecords.dart';
import 'package:pig_keep/Components/Transaction_MedicalRecords.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/medicine.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/medicine-service.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

class Medicalrecords extends StatefulWidget {
  Medicalrecords({super.key});

  @override
  State<Medicalrecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<Medicalrecords> {
  // services
  final medService = globalLocator.get<MedicineService>();
  final pigService = globalLocator.get<PigService>();
  final penService = globalLocator.get<PigPenService>();

  // controllers

  // add
  final TextEditingController _medNameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _costController = TextEditingController();

  // consume
  final TextEditingController _medNameEController = TextEditingController();
  final TextEditingController _quantityEController = TextEditingController();
  final TextEditingController _pigNumberEController = TextEditingController();

  // vars
  var selectedFarm;
  late String userOwner;
  List<Medicine> medicines = [];
  List<Map<String, dynamic>> medHistory = [];
  List<Map<String, dynamic>> pigs = [];

  // functions
  Future<void> fetchMedData() async {
    final meds = await medService.getMedicines(selectedFarm['_id']);
    final medH = await medService.getMedicineTransactions(selectedFarm['_id']);
    setState(() {
      medicines = meds;
      medHistory = medH;
    });
  }

  Future<void> getPigs() async {
    List<PigPen> pens =
        await penService.fetchPigPens(selectedFarm['_id'], userOwner);
    final fetchPigs = await pigService.fetchAllPigsInAllPens(pens);
    setState(() {
      pigs = fetchPigs;
    });
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      selectedFarm = context.read<GlobalProvider>().getSelectedFarm();
      userOwner = user['username'];
      fetchMedData();
      getPigs();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final farm = context.watch<GlobalProvider>().getSelectedFarm();
    setState(() {
      selectedFarm = farm;
    });
    fetchMedData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Container(
                  height: 57.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: appBlue, width: 1.5),
                    color: appSecondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      _quantityEController.text = '1';
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReusableDialogBox(
                            title: 'Consume Medicine',
                            description: 'Fill up the necessary information.',
                            formFields: [
                              RecyclableTextFormField(
                                controller: _medNameEController,
                                labelText: 'Medicine Name',
                                showDropdown: true,
                                dropdownItems: medicines
                                    .map((med) => CustomDropDownItem(
                                        med.medicineName,
                                        '${med.medicineName} ${med.dosage} | ${med.quantity}x'))
                                    .toList(),
                                hintText: 'Medicine Name',
                                hintTextSize: 14.sp,
                                icon: Icons.medical_services,
                                textSize: 14.sp,
                                readOnly: true,
                              ),
                              RecyclableTextFormField(
                                controller: _quantityEController,
                                labelText: 'Quantity',
                                hintText: 'Quantity',
                                hintTextSize: 14.sp,
                                icon: Icons.numbers,
                                textSize: 14.sp,
                                keyboardType: TextInputType.phone,
                              ),
                              RecyclableTextFormField(
                                controller: _pigNumberEController,
                                showDropdown: true,
                                dropdownItems: pigs
                                    .where((pig) => pig['status'] == 'alive')
                                    .map((pig) => CustomDropDownItem(
                                        pig['uuid'],
                                        'Pig: ${pig['pigNumber']} | ${pig['ageCategory']}'))
                                    .toList(),
                                labelText: 'Pig Number',
                                hintText: 'Pig Number',
                                hintTextSize: 14.sp,
                                icon: Icons.savings,
                                textSize: 14.sp,
                              ),
                            ],
                            onSave: () async {
                              try {
                                // perform consume mode
                                await medService.addMedicine(
                                    false,
                                    selectedFarm['_id'],
                                    'consumed',
                                    _medNameEController.text,
                                    null,
                                    '',
                                    int.parse(_quantityEController.text),
                                    0,
                                    _pigNumberEController.text);
                                await fetchMedData();
                                context.pop();
                                _medNameEController.clear();
                                _quantityEController.text = '1';
                                _pigNumberEController.clear();
                              } catch (err) {
                                ToastService().showErrorToast(err.toString());
                              }
                            },
                            saveButtonText: 'Consume',
                            saveButtonColor: appRed,
                          );
                        },
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Minus.png',
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text('Consume',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: appTertiary,
                              ))
                        ]),
                  )),
            ),
            Expanded(
              child: Container(
                height: 57.h,
                decoration: BoxDecoration(
                  border: Border.all(color: appBlue, width: 1.5),
                  color: appBlue,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReusableDialogBox(
                          title: 'New Medicine',
                          description: 'Fill up the necessary information.',
                          formFields: [
                            RecyclableTextFormField(
                              controller: _medNameController,
                              labelText: 'Medicine Name',
                              hintText: 'Medicine Name',
                              hintTextSize: 14.sp,
                              icon: Icons.medical_services,
                              textSize: 14.sp,
                            ),
                            RecyclableTextFormField(
                              controller: _dosageController,
                              labelText: 'Dosage eg. 10mg',
                              hintText: 'Dosage',
                              hintTextSize: 14.sp,
                              icon: Icons.scale,
                              textSize: 14.sp,
                            ),
                            RecyclableTextFormField(
                              controller: _quantityController,
                              labelText: 'Quantity',
                              hintText: 'Quantity',
                              hintTextSize: 14.sp,
                              icon: Icons.numbers,
                              textSize: 14.sp,
                              keyboardType: TextInputType.number,
                            ),
                            RecyclableTextFormField(
                              controller: _costController,
                              labelText: 'Cost Per Qty',
                              hintText: 'Cost Per Qty',
                              hintTextSize: 14.sp,
                              icon: Icons.php,
                              textSize: 14.sp,
                              keyboardType: TextInputType.number,
                            ),
                            RecyclableTextFormField(
                              controller: _descriptionController,
                              labelText: 'Description',
                              hintText: 'Description',
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              hintTextSize: 14.sp,
                              textSize: 14.sp,
                              minLines: 2,
                              maxLines: 5,
                            ),
                          ],
                          onSave: () async {
                            // Handle the save action, e.g., validate and save data
                            try {
                              await medService.addMedicine(
                                  false,
                                  selectedFarm['_id'],
                                  'stock',
                                  _medNameController.text,
                                  _dosageController.text,
                                  _descriptionController.text,
                                  int.parse(_quantityController.text),
                                  double.parse(_costController.text),
                                  null);
                              await fetchMedData();
                              context.pop();
                              _medNameController.clear();
                              _dosageController.clear();
                              _descriptionController.clear();
                              _quantityController.clear();
                              _costController.clear();
                            } catch (err) {
                              ToastService().showErrorToast(err.toString());
                            }
                          },
                          saveButtonText: 'Add Medicine',
                          saveButtonColor: appBlue,
                        );
                      },
                    );
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/Add.png',
                          width: 30.w,
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('Add Meds',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: appSecondary,
                            ))
                      ]),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        /* Container(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: SearchBar_MedicalRecords()), */ //Searchbar_MedicalRecords.dart
        SizedBox(
          height: 18.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 15.w),
          child: CarouselMedicalrecords(
              //Carousel_MedicalRecords.dart
              farmID: selectedFarm['_id'],
              fetchMedData: fetchMedData(),
              items: medicines // Dynamic list of items
              ),
        ),
        SizedBox(
          height: 17.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        TransactionMedicalrecords(
          medHistory: medHistory,
        ), //Transaction_Medicalrecords.dart
        SizedBox(
          //remove this later
          height: 600.h,
        ),
        const Text('-End of SCSV-'),
        SizedBox(
          //remove this later
          height: 110.h,
        ),
      ],
    );
  }
}
