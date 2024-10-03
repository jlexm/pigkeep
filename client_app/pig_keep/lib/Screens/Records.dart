// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pig_keep/Components/BottomNav.dart';
// import 'package:pig_keep/Components/Carousel_PigCount.dart';
// import 'package:pig_keep/Components/Chip.dart';
// import 'package:pig_keep/Components/DataTable_PigList.dart';
// import 'package:pig_keep/Components/FarmName.dart';
// import 'package:pig_keep/Components/FeedInventory.dart';
// import 'package:pig_keep/Components/MedicalRecords.dart';
// import 'package:pig_keep/Components/PigList.dart';
// import 'package:pig_keep/Components/PigPen.dart';
// import 'package:pig_keep/Components/PigPen_PenNumber.dart';
// import 'package:pig_keep/Components/QRCodeStatus.dart';
// import 'package:pig_keep/Components/SearchBar_PigList.dart';
// import 'package:pig_keep/Constants/color.constants.dart';
// import 'package:pig_keep/Components/Hamburger.dart';

// class Records extends StatefulWidget {
//   const Records({super.key});

//   @override
//   State<Records> createState() => _RecordsState();
// }

// class _RecordsState extends State<Records> {
//   int? _selectedChoiceIndex = 0;
//   Map<String, String>? _selectedRowData;
//   bool _showPigPenPenNumber = false;

//   void _onChipSelected(int? index) {
//     setState(() {
//       _selectedChoiceIndex = index;
//       _selectedRowData = null;
//       _showPigPenPenNumber = false; // Reset to show PigPen when switching chips
//     });
//   }

//   void _showQRCodeStatus(Map<String, String> rowData) {
//     setState(() {
//       _selectedChoiceIndex = null;
//       _selectedRowData = rowData;
//     });
//   }

//   void _showPigPenPenNumberScreen(Map<String, String> rowData) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PigPenPenNumber(
//           number: rowData['number']!,
//           type: rowData['type']!,
//           pigCount: rowData['pig count']!,
//           maxPigs: rowData['max pigs']!,
//           pigNumbers: []
//         ),
//       ),
//     );

//     if (result == 3) {
//       setState(() {
//         _selectedChoiceIndex = 3; // Set to PigPen chip
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appSecondary,
//       drawer: Hamburger(),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         FarmName(),
//                       ],
//                     ),
//                     SizedBox(height: 10.h),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 20.w),
//                       child: Text(
//                         'Update your pig farm records to keep you on \ntrack with your pig farm management experience.',
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 6.h,
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15.w),
//                       child: Chips(onChipSelected: _onChipSelected),
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Container(
//                       //Container containing Screens
//                       child: Column(
//                         children: [
//                           if (_selectedRowData != null && _showPigPenPenNumber)
//                             PigPenPenNumber(
//                               number: _selectedRowData!['number']!,
//                               type: _selectedRowData!['type']!,
//                               pigCount: _selectedRowData!['pig count']!,
//                               maxPigs: _selectedRowData!['max pigs']!,
//                               pigNumbers: [],
//                             )
//                           else if (_selectedRowData != null)
//                             QRCodeStatus(pigData: _selectedRowData!)
//                           else ...[
//                             if (_selectedChoiceIndex == 0)
//                               PigList(onRowSelected: _showQRCodeStatus),
//                             if (_selectedChoiceIndex == 1) FeedInventory(),
//                             if (_selectedChoiceIndex == 2) MedicalRecords(),
//                             if (_selectedChoiceIndex == 3)
//                               PigPen(onRowSelected: _showPigPenPenNumberScreen),
//                           ],
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Carousel_PigCount.dart';
import 'package:pig_keep/Components/Chip.dart';
import 'package:pig_keep/Components/DataTable_PigList.dart';
import 'package:pig_keep/Components/FarmName.dart';
import 'package:pig_keep/Components/FeedInventory.dart';
import 'package:pig_keep/Components/MedicalRecords.dart';
import 'package:pig_keep/Components/PigList.dart';
import 'package:pig_keep/Components/PigPen.dart';
import 'package:pig_keep/Components/PigPen_PenNumber.dart';
import 'package:pig_keep/Components/QRCodeStatus.dart';
import 'package:pig_keep/Components/SearchBar_PigList.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Components/Hamburger.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  int? _selectedChoiceIndex = 0;
  var _selectedRowData;
  Widget? _currentView;

  @override
  void initState() {
    super.initState();
    _currentView = _buildInitialView();
  }

  Widget _buildInitialView() {
    if (_selectedRowData != null) {
      if (_selectedChoiceIndex == 3) {
        return PigPenPenNumber(
          number: _selectedRowData!['number']!,
          type: _selectedRowData!['type']!,
          pigCount: _selectedRowData!['pig count']!,
          maxPigs: _selectedRowData!['max pigs']!,
          pigNumbers: const [], // Fetch and pass actual pig numbers if needed
        );
      }
      return QRCodeStatus(pigData: _selectedRowData!);
    } else {
      switch (_selectedChoiceIndex) {
        case 0:
          return PigPen(onRowSelected: _showPigPenPenNumberScreen);
        case 1:
          return PigList(onRowSelected: _showQRCodeStatus);
        case 2:
          return const FeedInventory();
        case 3:
          return const MedicalRecords();
        default:
          return Container(); // Default view
      }
    }
  }

  void _onChipSelected(int? index) {
    setState(() {
      _selectedChoiceIndex = index;
      _selectedRowData = null;
      _currentView = _buildInitialView();
    });
  }

  void _showQRCodeStatus(Map<String, dynamic> rowData) {
    setState(() {
      _selectedChoiceIndex = 1;
      _selectedRowData = rowData;
      _currentView = QRCodeStatus(pigData: rowData);
    });
  }

  void _showPigPenPenNumberScreen(final rowData) {
    setState(() {
      _selectedChoiceIndex = 0;
      _selectedRowData = rowData;
      _currentView = PigPenPenNumber(
        number: rowData.penNumber!,
        type: rowData.penType!,
        pigCount: rowData.currentPigCount!,
        maxPigs: rowData.maxPigCount!,
        pigNumbers: const [], // Fetch and pass actual pig numbers if needed
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        FarmName(),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Update your pig farm records to keep you on \ntrack with your pig farm management experience.',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Chips(onChipSelected: _onChipSelected),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      // Container containing Screens
                      child: _currentView,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
