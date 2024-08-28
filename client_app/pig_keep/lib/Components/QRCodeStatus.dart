// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pig_keep/Constants/color.constants.dart';

// class QRCodeStatus extends StatefulWidget {
//   const QRCodeStatus({super.key});

//   @override
//   State<QRCodeStatus> createState() => _QRCodeStatusState();
// }

// class _QRCodeStatusState extends State<QRCodeStatus> {
//   // Variable to hold the pig's status
//   String pigStatus = 'Alive'; // Options: 'Alive', 'Sold', 'Deceased'

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 20.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _StatusContainer(
//               text: 'Alive',
//               color: pigStatus == 'Alive' ? appBlue : appSecondary,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//               ),
//               isSelected: pigStatus == 'Alive',
//             ),
//             _StatusContainer(
//               text: 'Sold',
//               color: pigStatus == 'Sold' ? appPrimary : appSecondary,
//               borderRadius: BorderRadius.zero,
//               isSelected: pigStatus == 'Sold',
//             ),
//             _StatusContainer(
//               text: 'Deceased',
//               color: pigStatus == 'Deceased' ? appRed : appSecondary,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//               ),
//               isSelected: pigStatus == 'Deceased',
//             ),
//           ],
//         ),
//         SizedBox(height: 15.h),
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
//             ),
//           ],
//         ),
//         SizedBox(height: 40.h),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             children: [
//               _DetailRow(label: 'Date of Birth: ', value: 'March 12, 2024'),
//               _DetailRow(label: 'Age: ', value: '82 days'),
//               _DetailRow(label: 'Age Category: ', value: 'Weaner'),
//               _DetailRow(label: 'Sex: ', value: 'Female'),
//               _DetailRow(label: 'Parent Number: ', value: '002'),
//               _DetailRow(label: 'Current Feed: ', value: 'Uno Grower'),
//               _DetailRow(label: 'Pigpen Number: ', value: 'P-02'),
//               _DetailRow(label: 'Recorded Weight (Kg): ', value: '82'),
//               _DetailRow(label: 'Date: ', value: '06-23-24'),
//               _DetailRow(label: 'Price Sold: ', value: '---'),
//               _DetailRow(label: 'Date: ', value: '---'),
//             ],
//           ),
//         ),
//         SizedBox(height: 26.h),
//         Row(
//           children: [
//             SizedBox(width: 20.w),
//             _ActionButton(
//               text: 'Back',
//               color: Colors.transparent,
//               borderColor: appTertiary,
//               textColor: Colors.black,
//               icon: Icons.keyboard_arrow_left_rounded,
//               onTap: () {},
//             ),
//             Spacer(),
//             if (pigStatus == 'Alive') ...[
//               _ActionButton(
//                 text: 'Update',
//                 color: Colors.transparent,
//                 borderColor: appBlue,
//                 textColor: appBlue,
//                 onTap: () {},
//               ),
//               SizedBox(width: 5.w),
//               _ActionButton(
//                 text: 'QR Code',
//                 color: appOrange,
//                 borderColor: appOrange,
//                 textColor: appSecondary,
//                 icon: Icons.download,
//                 onTap: () {},
//               ),
//             ],
//             SizedBox(width: 20.w),
//           ],
//         ),
//         SizedBox(height: 20.h),
//       ],
//     );
//   }

//   // Widget for status containers
//   Widget _StatusContainer({
//     required String text,
//     required Color color,
//     required BorderRadius borderRadius,
//     required bool isSelected,
//   }) {
//     return Container(
//       height: 35.h,
//       width: 83.w,
//       decoration: BoxDecoration(
//         border: Border.all(color: appTertiary, width: 1),
//         color: color,
//         borderRadius: borderRadius,
//       ),
//       child: Center(
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 12.sp,
//             fontWeight: FontWeight.w400,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget for detail rows
//   Widget _DetailRow({required String label, required String value}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               color: appPrimary,
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget for action buttons
//   Widget _ActionButton({
//     required String text,
//     required Color color,
//     required Color borderColor,
//     required Color textColor,
//     IconData? icon,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 35.h,
//         width: icon == null ? 83.w : 95.w,
//         decoration: BoxDecoration(
//           border: Border.all(color: borderColor),
//           borderRadius: BorderRadius.circular(10.r),
//           color: color,
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (icon != null) Icon(icon, color: textColor),
//               if (icon != null) SizedBox(width: 5.w),
//               Text(
//                 text,
//                 style: TextStyle(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w600,
//                   color: textColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
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
    return SingleChildScrollView(
      child: Column(
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
              SizedBox(width: 10.w),
              _ActionButton(
                text: 'Back',
                color: Colors.transparent,
                borderColor: appTertiary,
                textColor: Colors.black,
                icon: Icons.keyboard_arrow_left_rounded,
                onTap: () {},
              ),
              Spacer(),
              if (pigStatus == 'Alive') ...[
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
