// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pig_keep/Constants/color.constants.dart';

// class QRCodeStatus extends StatefulWidget {
//   const QRCodeStatus({super.key});

//   @override
//   State<QRCodeStatus> createState() => _QRCodeStatusState();
// }

// class _QRCodeStatusState extends State<QRCodeStatus> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 Container(
//                   height: 35.h,
//                   width: 83.w,
//                   decoration: BoxDecoration(
//                     border: Border(
//                       top: BorderSide(color: appTertiary, width: 1),
//                       left: BorderSide(color: appTertiary, width: 1),
//                       bottom: BorderSide(color: appTertiary, width: 1),
//                     ),
//                     color: appBlue,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       bottomLeft: Radius.circular(10),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Alive',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Container(
//                   height: 35.h,
//                   width: 83.w,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: appTertiary, width: 1),
//                     color: appPrimary,
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Sold',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Container(
//                   height: 35.h,
//                   width: 83.w,
//                   decoration: BoxDecoration(
//                     border: Border(
//                       top: BorderSide(color: appTertiary, width: 1),
//                       right: BorderSide(color: appTertiary, width: 1),
//                       bottom: BorderSide(color: appTertiary, width: 1),
//                     ),
//                     color: appRed,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Deceased',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//         SizedBox(
//           height: 15.h,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 135.h,
//               child: Text(
//                 '006',
//                 style: TextStyle(
//                   fontSize: 100.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             Text(
//               'Pig Number',
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w400,
//                 color: appPrimary,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 40.h,
//         ),
//         Container( //Container
//           padding: const EdgeInsets.only(
//             left: 25,
//             right: 25,
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Date of Birth:  ',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Text(
//                       "March 12, 2024",
//                       style: TextStyle(
//                         color: appPrimary,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Age:  ',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Text(
//                       "82 days",
//                       style: TextStyle(
//                         color: appPrimary,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Age Category:  ',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Text(
//                       "Weaner",
//                       style: TextStyle(
//                         color: appPrimary,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Sex:  ',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Text(
//                       "Female",
//                       style: TextStyle(
//                         color: appPrimary,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Parent Number:  ',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Text(
//                       "002",
//                       style: TextStyle(
//                         color: appPrimary,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Current Feed:  ',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Text(
//                       "Uno Grower",
//                       style: TextStyle(
//                         color: appPrimary,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Pigpen Number:  ',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Text(
//                       "P-02",
//                       style: TextStyle(
//                         color: appPrimary,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 5.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Recorded Weight (Kg):  ',
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         Text(
//                           "82",
//                           style: TextStyle(
//                             color: appPrimary,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 5.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Date:  ',
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         Text(
//                           "06-23-24",
//                           style: TextStyle(
//                             color: appPrimary,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 5.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Price Sold:  ',
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         Text(
//                           "---",
//                           style: TextStyle(
//                             color: appPrimary,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 5.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Date:  ',
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         Text(
//                           "---",
//                           style: TextStyle(
//                             color: appPrimary,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 26.h,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 20.w,
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 35.h,
//                 width: 83.w,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: appTertiary),
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     left: 10.w,
//                     right: 10.w,
//                   ),
//                   child: Row(children: [
//                     Icon(Icons.keyboard_arrow_left_rounded),
//                     Text(
//                       'Back',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ]),
//                 ),
//               ),
//             ),
//             Spacer(),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 35.h,
//                 width: 69.w,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: appBlue),
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Update',
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                           color: appBlue,
//                         ),
//                       ),
//                     ]),
//               ),
//             ),
//             SizedBox(
//               width: 5.w,
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 35.h,
//                 width: 95.w,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: appOrange),
//                   borderRadius: BorderRadius.circular(10.r),
//                   color: appOrange,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.download,
//                             color: appSecondary,
//                           ),
//                           Text(
//                             'QR Code',
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600,
//                               color: appSecondary,
//                             ),
//                           ),
//                         ]),
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
//           height: 20.h,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class QRCodeStatus extends StatefulWidget {
  const QRCodeStatus({super.key});

  @override
  State<QRCodeStatus> createState() => _QRCodeStatusState();
}

class _QRCodeStatusState extends State<QRCodeStatus> {
  // Variable to hold the pig's status
  String pigStatus = 'Alive'; // Options: 'Alive', 'Sold', 'Deceased'

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _StatusContainer(
              text: 'Alive',
              color: pigStatus == 'Alive' ? appBlue : appSecondary,
              
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              isSelected: pigStatus == 'Alive',
            ),
            _StatusContainer(
              text: 'Sold',
              color: pigStatus == 'Sold' ? appPrimary : appSecondary,
              
              borderRadius: BorderRadius.zero,
              isSelected: pigStatus == 'Sold',
            ),
            _StatusContainer(
              text: 'Deceased',
              color: pigStatus == 'Deceased' ? appRed : appSecondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              isSelected: pigStatus == 'Deceased',
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
                '006',
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
              _DetailRow(label: 'Date of Birth: ', value: 'March 12, 2024'),
              _DetailRow(label: 'Age: ', value: '82 days'),
              _DetailRow(label: 'Age Category: ', value: 'Weaner'),
              _DetailRow(label: 'Sex: ', value: 'Female'),
              _DetailRow(label: 'Parent Number: ', value: '002'),
              _DetailRow(label: 'Current Feed: ', value: 'Uno Grower'),
              _DetailRow(label: 'Pigpen Number: ', value: 'P-02'),
              _DetailRow(label: 'Recorded Weight (Kg): ', value: '82'),
              _DetailRow(label: 'Date: ', value: '06-23-24'),
              _DetailRow(label: 'Price Sold: ', value: '---'),
              _DetailRow(label: 'Date: ', value: '---'),
            ],
          ),
        ),
        SizedBox(height: 26.h),
        Row(
          children: [
            SizedBox(width: 20.w),
            _ActionButton(
              text: 'Back',
              color: Colors.transparent,
              borderColor: appTertiary,
              textColor: Colors.black,
              icon: Icons.keyboard_arrow_left_rounded,
              onTap: () {},
            ),
            Spacer(),
            _ActionButton(
              text: 'Update',
              color: Colors.transparent,
              borderColor: appBlue,
              textColor: appBlue,
              onTap: () {},
            ),
            SizedBox(width: 5.w),
            _ActionButton(
              text: 'QR Code',
              color: appOrange,
              borderColor: appOrange,
              textColor: appSecondary,
              icon: Icons.download,
              onTap: () {},
            ),
            SizedBox(width: 20.w),
          ],
        ),
        SizedBox(height: 20.h),
      ],
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

  // Widget for detail rows
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

  // Widget for action buttons
  Widget _ActionButton({
    required String text,
    required Color color,
    required Color borderColor,
    required Color textColor,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.h,
        width: icon == null ? 83.w : 95.w,
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
                  fontWeight: FontWeight.w600,
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