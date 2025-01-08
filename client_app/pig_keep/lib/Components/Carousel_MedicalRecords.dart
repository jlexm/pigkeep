import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/medicine.dart';
import 'package:pig_keep/Services/medicine-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';

class CarouselMedicalrecords extends StatefulWidget {
  final List<Medicine> items;
  final Future<void> fetchMedData;
  final String farmID;

  const CarouselMedicalrecords(
      {super.key,
      required this.items,
      required this.fetchMedData,
      required this.farmID});

  @override
  State<CarouselMedicalrecords> createState() => _CarouselMedicalrecordsState();
}

class _CarouselMedicalrecordsState extends State<CarouselMedicalrecords> {
  //services
  final medService = globalLocator.get<MedicineService>();

  //controllers
  // add
  final TextEditingController _medNameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 15.h,
      ),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          padEnds: false,
          height: 90.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.45,
          initialPage: 1,
          enableInfiniteScroll: false,
          reverse: false,
          enlargeFactor: 0.01,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final item = widget.items[index];

          return InkWell(
            child: Container(
              padding: EdgeInsets.all(3),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: appBlue, width: 1.5.w),
                color: appSecondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  // Main content of the container
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${item.quantity}x',
                              style: TextStyle(
                                  height: 0.9.h,
                                  fontSize: 22.sp,
                                  color: appBlue,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${item.medicineName.length > 16 ? item.medicineName.substring(0, 16) + '...' : item.medicineName}\n${item.dosage}',
                              style: TextStyle(fontSize: 12.0.sp),
                              textAlign: TextAlign.center, // Center the text
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // Positioned + button
                  Positioned(
                    top: 0, // Adjust as necessary
                    right: 0, // Adjust as necessary
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 20.sp,
                        color: appBlue, // Customize as needed
                      ),
                      onPressed: () {
                        _medNameController.text = item.medicineName;
                        _dosageController.text = item.dosage;
                        _costController.text = '${item.avgCost}';
                        _descriptionController.text = item.description;

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReusableDialogBox(
                              title: '${item.medicineName} ${item.dosage}',
                              description:
                                  'Enter the quantity to add to the current stock of ${item.medicineName}',
                              formFields: [
                                RecyclableTextFormField(
                                  controller: _medNameController,
                                  labelText: 'Medicine Name',
                                  hintText: 'Medicine Name',
                                  hintTextSize: 14.sp,
                                  icon: Icons.medical_services,
                                  textSize: 14.sp,
                                  readOnly: true,
                                  enabled: false,
                                ),
                                RecyclableTextFormField(
                                  controller: _dosageController,
                                  labelText: 'Dosage eg. 10mg',
                                  hintText: 'Dosage',
                                  hintTextSize: 14.sp,
                                  icon: Icons.scale,
                                  textSize: 14.sp,
                                  readOnly: true,
                                  enabled: false,
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
                              ],
                              onSave: () async {
                                // Handle the save action, e.g., validate and save data
                                try {
                                  await medService.addMedicine(
                                      false,
                                      widget.farmID,
                                      'stock',
                                      _medNameController.text,
                                      _dosageController.text,
                                      _descriptionController.text,
                                      int.parse(_quantityController.text),
                                      double.parse(_costController.text),
                                      null);
                                  await widget.fetchMedData;
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
                              saveButtonText: 'Save',
                              saveButtonColor: appBlue,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              _medNameController.text = item.medicineName;
              _dosageController.text = item.dosage;
              _quantityController.text = '${item.quantity}';
              _costController.text = '${item.avgCost}';
              _descriptionController.text = item.description;

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ReusableDialogBox(
                    title: 'Edit Medicine',
                    description:
                        'Review the details below and make changes if needed.',
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
                        icon: Icons.price_change_rounded,
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
                            true,
                            widget.farmID,
                            'stock',
                            _medNameController.text,
                            _dosageController.text,
                            _descriptionController.text,
                            int.parse(_quantityController.text),
                            double.parse(_costController.text),
                            null);
                        await widget.fetchMedData;
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
                    saveButtonText: 'Save',
                    saveButtonColor: appBlue,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
