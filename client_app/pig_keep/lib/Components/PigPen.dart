// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pig_keep/Components/DataTable_PigList.dart';
// import 'package:pig_keep/Components/DataTable_PigPen.dart';
// import 'package:pig_keep/Components/SearchBar_PigPen.dart';
// //import 'package:pig_keep/Components/SearchBar_PigPen.dart';
// import 'package:pig_keep/Constants/color.constants.dart';
// import 'package:pig_keep/Modals/ReusableDialogBox.dart';

// class PigPen extends StatefulWidget {
//   final void Function(Map<String, String>) onRowSelected;

//   const PigPen({super.key, required this.onRowSelected});

//   @override
//   State<PigPen> createState() => _PigPenState();
// }

// class _PigPenState extends State<PigPen> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           //Greenbox
//           children: [
//             SizedBox(
//               width: 20.w,
//             ),
//             Expanded(
//               child: Container(
//                 height: 95.h,
//                 padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: appPrimary),
//                   color: appPrimary,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           '05',
//                           style: TextStyle(
//                             color: appSecondary,
//                             fontSize: 70.sp,
//                             fontWeight: FontWeight.bold,
//                             height: 0.9.h,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 9.w,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Total \nPigpens',
//                           style: TextStyle(
//                               color: appSecondary,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w300),
//                         )
//                       ],
//                     ),
//                     Spacer(),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 36.h,
//                           width: 93.w,
//                           padding: EdgeInsets.only(left: 9.w, right: 9.w),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: appPrimary),
//                             color: appSecondary,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return ReusableDialogBox(
//                                     title: 'Add Pigpen',
//                                     description:
//                                         'Fill up the necessary information.',
//                                     formFields: [
//                                       RecyclableTextFormField(
//                                         controller: TextEditingController(),
//                                         labelText: 'Pen Type',
//                                         showDropdown: true,
//                                         dropdownItems: [
//                                           'Stall',
//                                           'Nursery',
//                                           'Farrowing'
//                                         ],
//                                         hintText: 'Pen Type',
//                                         hintTextSize: 14.sp,
//                                         icon: Icons.email,
//                                         textSize: 14.sp,
//                                         height: 43.h,
//                                       ),
//                                       RecyclableTextFormField(
//                                         controller: TextEditingController(),
//                                         labelText: 'Max Number',
//                                         hintText: 'Max Number',
//                                         hintTextSize: 14.sp,
//                                         icon: Icons.email,
//                                         textSize: 14.sp,
//                                         height: 43.h,
//                                       ),
//                                     ],
//                                     onSave: () {
//                                       // Handle the save action, e.g., validate and save data
//                                       print('Form saved');
//                                       Navigator.of(context).pop();
//                                     },
//                                     saveButtonText: 'Add Pen',
//                                     saveButtonColor: appPrimary,
//                                   );
//                                 },
//                               );
//                             },
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.add_circle_rounded,
//                                   color: appTertiary,
//                                   size: 20.h,
//                                 ),
//                                 SizedBox(width: 3.h),
//                                 Text(
//                                   'Add Pen',
//                                   style: TextStyle(
//                                     color: appTertiary,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 12.sp,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 20.w,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 11.h,
//         ),
//         Container(
//           padding: EdgeInsets.only(
//             left: 20.w,
//             right: 20.w,
//           ),
//           child: SearchBarPigPen(), //SearchBar_PigPen.dart
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Container(
//           //changable to PigPem
//           child: Column(
//             children: [
//               MyDataTable_Pigpen(onRowSelected: widget.onRowSelected),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/DataTable_PigPen.dart';
import 'package:pig_keep/Components/PigPen_PenNumber.dart';
import 'package:pig_keep/Components/SearchBar_PigPen.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';

class PigPen extends StatefulWidget {
  final void Function(Map<String, String>) onRowSelected;

  const PigPen({super.key, required this.onRowSelected});

  @override
  State<PigPen> createState() => _PigPenState();
}

class _PigPenState extends State<PigPen> {
  void _navigateToPigPenPenNumber(Map<String, dynamic> rowData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PigPenPenNumber(
          number: rowData['number']!,
          type: rowData['type']!,
          pigCount: rowData['pig count']!,
          maxPigs: rowData['max pigs']!,
          pigNumbers: List<String>.from(rowData['pigs']),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // Green box
          children: [
            SizedBox(width: 20.w),
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
                          '05',
                          style: TextStyle(
                            color: appSecondary,
                            fontSize: 70.sp,
                            fontWeight: FontWeight.bold,
                            height: 0.9.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 9.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total \nPigpens',
                          style: TextStyle(
                            color: appSecondary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 36.h,
                          width: 93.w,
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
                                    title: 'Add Pigpen',
                                    description:
                                        'Fill up the necessary information.',
                                    formFields: [
                                      RecyclableTextFormField(
                                        controller: TextEditingController(),
                                        labelText: 'Pen Type',
                                        showDropdown: true,
                                        dropdownItems: [
                                          'Stall',
                                          'Nursery',
                                          'Farrowing'
                                        ],
                                        hintText: 'Pen Type',
                                        hintTextSize: 14.sp,
                                        icon: Icons.email,
                                        textSize: 14.sp,
                                        height: 43.h,
                                      ),
                                      RecyclableTextFormField(
                                        controller: TextEditingController(),
                                        labelText: 'Max Number',
                                        hintText: 'Max Number',
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
                                    saveButtonText: 'Add Pen',
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
                                  'Add Pen',
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
            SizedBox(width: 20.w),
          ],
        ),
        SizedBox(height: 11.h),
        Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: SearchBarPigPen(), // SearchBar_PigPen.dart
        ),
        SizedBox(height: 10.h),
        Container(
          // changable to PigPen
          child: Column(
            children: [
              MyDataTable_Pigpen(
                onRowSelected: _navigateToPigPenPenNumber,
              )
            ],
          ),
        ),
      ],
    );
  }
}
