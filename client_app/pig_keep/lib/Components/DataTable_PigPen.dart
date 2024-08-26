import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/QRCodeStatus.dart';

class MyDataTable_Pigpen extends StatefulWidget {
  const MyDataTable_Pigpen({super.key});

  @override
  State<MyDataTable_Pigpen> createState() => _MyDataTable_PigpenState();
}

class _MyDataTable_PigpenState extends State<MyDataTable_Pigpen> {
  final List<Map<String, String>> _data = [
    {
      'number': 'P-01',
      'type': 'Nursery',
      'pig count': '3',
      'max pigs': '5',
      'status': 'alive'
    },
    {
      'number': 'P-02',
      'type': 'Stall',
      'pig count': '5',
      'max pigs': '5',
      'status': 'sold'
    },
    {
      'number': 'P-03',
      'type': 'Stall',
      'pig count': '6',
      'max pigs': '6',
      'status': 'deceased'
    },
    {
      'number': 'P-04',
      'type': 'Farrowing',
      'pig count': '1',
      'max pigs': '1',
      'status': 'alive'
    },
  ];

  void _navigateToQRCodeStatus(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRCodeStatus()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'Type',
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
                    'Pig Count',
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
                    'Max Pigs',
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
                      child: Text(
                        row['number']!,
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
                        row['type']!,
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
                        row['pig count']!,
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
                        row['max pigs']!,
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
