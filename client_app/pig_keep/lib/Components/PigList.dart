import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/DataTable_PigList.dart';
import 'package:pig_keep/Components/SearchBar_PigList.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

class PigList extends StatefulWidget {
  final void Function(Map<String, dynamic> rowData)? onRowSelected;

  const PigList({super.key, this.onRowSelected});

  @override
  State<PigList> createState() => _PigListState();
}

class _PigListState extends State<PigList> {
  // controller
  final TextEditingController _pigNumberController = TextEditingController();
  final TextEditingController _pigDOBController = TextEditingController();
  final TextEditingController _pigParentController = TextEditingController();
  final TextEditingController _pigSexController = TextEditingController();
  final TextEditingController _pigPenController = TextEditingController();

  String? pigUuidHidden;
  String? penUuidHidden;

  // pig db
  final pigService = globalLocator.get<PigService>();
  final penService = globalLocator.get<PigPenService>();

  // pigs variables
  var selectedFarm;
  late String userOwner;
  List<Map<String, dynamic>> pigs = [];
  List<PigPen> pigPens = [];
  String searchValue = '';

  // fns
  Future<void> getPigs() async {
    if (!mounted) return;
    // fetch all pens first
    List<PigPen> pens =
        await penService.fetchPigPens(selectedFarm['_id'], userOwner);
    final fetchPigs = await pigService.fetchAllPigsInAllPens(pens);
    setState(() {
      pigs = fetchPigs;
      pigPens = pens;
    });
  }

  Future<void> addPig() async {
    String pigNumber =
        'P-${_pigNumberController.text.toString().padLeft(3, '0')}';

    // check if pig nubmer already exists on local db
    final existingPig =
        await pigService.fetchPigByNumber(pigNumber, selectedFarm['_id']);
    if (existingPig != null) {
      throw 'Pig Number already exists';
    }

    await pigService.addPig(
        userOwner,
        selectedFarm['_id'],
        penUuidHidden!,
        pigNumber,
        pigUuidHidden,
        _pigSexController.text == 'Male',
        DateTime.parse(_pigDOBController.text));
    await getPigs();
  }

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
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      selectedFarm = context.read<GlobalProvider>().getSelectedFarm();
      userOwner = user['username'];
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
    getPigs();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Container(
                height: 95.h,
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  border: Border.all(color: appPrimary),
                  color: appPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          pigs
                              .where((pig) => pig['status'] == 'alive')
                              .length
                              .toString(),
                          style: TextStyle(
                            color: appSecondary,
                            fontSize: 70.sp,
                            fontWeight: FontWeight.bold,
                            height: 0.9.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total \nLiving Pig',
                          style: TextStyle(
                              color: appSecondary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 36.h,
                          width: 95.w,
                          padding: EdgeInsets.only(left: 9.w, right: 9.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: appPrimary),
                            color: appSecondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ReusableDialogBox(
                                    title: 'Add Pig',
                                    description:
                                        'Fill up the necessary information.',
                                    formFields: [
                                      RecyclableTextFormField(
                                        controller: _pigNumberController,
                                        labelText: 'Pig Number',
                                        hintText: 'Pig Number',
                                        hintTextSize: 14.sp,
                                        keyboardType: TextInputType.phone,
                                        icon: Icons.numbers_rounded,
                                        textSize: 14.sp,
                                      ),
                                      RecyclableTextFormField(
                                        controller: _pigDOBController,
                                        keyboardType: TextInputType.datetime,
                                        labelText: 'Date of Birth',
                                        hintText: 'YYYY/MM/DD',
                                        hintTextSize: 14.sp,
                                        icon: Icons.calendar_month,
                                        textSize: 14.sp,
                                        onTap: () {
                                          _selectDate();
                                        },
                                        readOnly: true,
                                      ),
                                      RecyclableTextFormField(
                                        controller: _pigParentController,
                                        labelText: 'Parent Number',
                                        showDropdown: true,
                                        isHiddenText: true,
                                        onChanged: (v) => {pigUuidHidden = v},
                                        dropdownItems: pigs
                                            .where((pig) =>
                                                (pig['ageCategory'] == 'Sow') &&
                                                pig['status'] == 'alive')
                                            .map((pig) => CustomDropDownItem(
                                                pig['uuid'],
                                                'Pig: ${pig['pigNumber']} | Pen: ${pig['penNumber']}'))
                                            .toList(),
                                        hintText: 'Parent Number',
                                        hintTextSize: 14.sp,
                                        icon: Icons.savings,
                                        textSize: 14.sp,
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
                                        hintText: 'Sex',
                                        hintTextSize: 14.sp,
                                        icon: Icons.male,
                                        textSize: 14.sp,
                                        readOnly: true,
                                      ),
                                      RecyclableTextFormField(
                                        controller: _pigPenController,
                                        labelText: 'Pen Number',
                                        showDropdown: true,
                                        isHiddenText: true,
                                        onChanged: (v) => {penUuidHidden = v},
                                        dropdownItems: pigPens
                                            .map((pen) => CustomDropDownItem(
                                                pen.uuid,
                                                '${pen.penNumber} | ${pen.penType}'))
                                            .toList(),
                                        hintText: 'Pen Number',
                                        hintTextSize: 14.sp,
                                        icon: Icons.house_siding_rounded,
                                        textSize: 14.sp,
                                        readOnly: true,
                                      ),
                                    ],
                                    onSave: () async {
                                      try {
                                        // Handle the save action, e.g., validate and save data
                                        await addPig();
                                        Navigator.of(context).pop();
                                        _pigDOBController.clear();
                                        _pigNumberController.clear();
                                        _pigParentController.clear();
                                        _pigSexController.clear();
                                        _pigPenController.clear();
                                        penUuidHidden = null;
                                        pigUuidHidden = null;
                                      } catch (error) {
                                        ToastService()
                                            .showErrorToast(error.toString());
                                      }
                                    },
                                    saveButtonText: 'Add Pig',
                                    saveButtonColor: appPrimary,
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle_rounded,
                                  color: appTertiary,
                                  size: 20.h,
                                ),
                                SizedBox(width: 3.h),
                                Text(
                                  'Add Pig',
                                  style: TextStyle(
                                    color: appTertiary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 11.h,
        ),
        Row(
          // QR code & Search
          children: [
            SizedBox(
              width: 20.w,
            ),
            Column(
              children: [
                Container(
                  height: 34.h,
                  width: 100.w,
                  padding: EdgeInsets.only(left: 6.w, right: 8.w),
                  decoration: BoxDecoration(
                    color: appOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.download,
                          color: appSecondary,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'QR Codes',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: appSecondary),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            SearchBar_PigList(), // SearchBar_PigList.dart
            InkWell(
              // Filter
              onTap: () {},
              child: Icon(
                Icons.filter_alt_outlined,
                size: 35,
                color: appTertiary,
              ),
            ),
            SizedBox(
              width: 18.w,
            ),
          ],
        ),
        Column(
          children: [
            MyDataTable(
              onRowSelected: (Map<String, dynamic> pigData) {
                context.push('/records/pigs/${pigData['uuid']}');
              },
              pigs: pigs,
            ),
          ],
        ),
      ],
    );
  }
}
