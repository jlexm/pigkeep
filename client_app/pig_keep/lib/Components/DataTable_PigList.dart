import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/QRCodeStatus.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class MyDataTable extends StatefulWidget {
  const MyDataTable({super.key});

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  final List<Map<String, String>> _data = [
    {
      'number': '001',
      'category': 'Sow',
      'feed': 'Uno Grower',
      'pen': '001',
      'status': 'alive'
    },
    {
      'number': '002',
      'category': 'Weaner',
      'feed': 'Uno Starter',
      'pen': '002',
      'status': 'sold'
    },
    {
      'number': '003',
      'category': 'Sow',
      'feed': 'Uno Grower',
      'pen': '002',
      'status': 'deceased'
    },
    
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'alive':
        return appBlue;
      case 'sold':
        return appPrimary;
      case 'deceased':
        return appRed;
      default:
        return Colors.grey;
    }
  }

  void _navigateToQRCodeStatus(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRCodeStatus()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            showCheckboxColumn: false,
            columnSpacing: 30.w,
            dividerThickness: 0,
            columns: [
              DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                label: Center(
                  child: Text(
                    'Number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                label: Center(
                  child: Text(
                    'Age \nCategory',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                label: Center(
                  child: Text(
                    'Current \nFeed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                label: Center(
                  child: Text(
                    'Pen \nNumber',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
            rows: _data.map((row) {
              return DataRow(
                onSelectChanged: (_) => _navigateToQRCodeStatus(context),
                cells: [
                  DataCell(
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _getStatusColor(row['status']!),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            row['number']!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.5.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        row['category']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.5.sp,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        row['feed']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.5.sp,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        row['pen']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.5.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pig_keep/Components/QRCodeStatus.dart';
// import 'package:pig_keep/Constants/color.constants.dart';

// class MyDataTable extends StatefulWidget {
//   final Function() onRowSelected; // Callback to handle row selection

//   const MyDataTable({super.key, required this.onRowSelected});

//   @override
//   State<MyDataTable> createState() => _MyDataTableState();
// }

// class _MyDataTableState extends State<MyDataTable> {
//   final List<Map<String, String>> _data = [
//     {
//       'number': '001',
//       'category': 'Sow',
//       'feed': 'Uno Grower',
//       'pen': '001',
//       'status': 'alive'
//     },
//     {
//       'number': '002',
//       'category': 'Weaner',
//       'feed': 'Uno Starter',
//       'pen': '002',
//       'status': 'sold'
//     },
//     {
//       'number': '003',
//       'category': 'Sow',
//       'feed': 'Uno Grower',
//       'pen': '002',
//       'status': 'deceased'
//     },
//   ];

//   Color _getStatusColor(String status) {
//     switch (status) {
//       case 'alive':
//         return appBlue;
//       case 'sold':
//         return appPrimary;
//       case 'deceased':
//         return appRed;
//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 20.h),
//       child: Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             showCheckboxColumn: false,
//             columnSpacing: 30.w,
//             dividerThickness: 0,
//             columns: [
//               DataColumn(
//                 headingRowAlignment: MainAxisAlignment.center,
//                 label: Center(
//                   child: Text(
//                     'Number',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               DataColumn(
//                 headingRowAlignment: MainAxisAlignment.center,
//                 label: Center(
//                   child: Text(
//                     'Age \nCategory',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               DataColumn(
//                 headingRowAlignment: MainAxisAlignment.center,
//                 label: Center(
//                   child: Text(
//                     'Current \nFeed',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               DataColumn(
//                 headingRowAlignment: MainAxisAlignment.center,
//                 label: Center(
//                   child: Text(
//                     'Pen \nNumber',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//             rows: _data.map((row) {
//               return DataRow(
//                 onSelectChanged: (_) {
//                   widget.onRowSelected(); // Call the callback when a row is selected
//                 },
//                 cells: [
//                   DataCell(
//                     Center(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: 12.w,
//                             height: 12.h,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: _getStatusColor(row['status']!),
//                             ),
//                           ),
//                           SizedBox(width: 8.w),
//                           Text(
//                             row['number']!,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 11.5.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   DataCell(
//                     Center(
//                       child: Text(
//                         row['category']!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 11.5.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                   DataCell(
//                     Center(
//                       child: Text(
//                         row['feed']!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 11.5.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                   DataCell(
//                     Center(
//                       child: Text(
//                         row['pen']!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 11.5.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
