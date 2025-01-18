import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDataTable_Pigpen extends StatefulWidget {
  final void Function(dynamic) onRowSelected;
  List<dynamic> pigPens;

  MyDataTable_Pigpen(
      {super.key, required this.onRowSelected, required this.pigPens});

  @override
  State<MyDataTable_Pigpen> createState() => _MyDataTable_PigpenState();
}

class _MyDataTable_PigpenState extends State<MyDataTable_Pigpen> {
  void _handleRowSelection(final row) {
    widget.onRowSelected(row);
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
            rows: widget.pigPens.map((row) {
              return DataRow(
                onSelectChanged: (_) => _handleRowSelection(row),
                cells: [
                  DataCell(
                    Center(
                      child: Text(
                        row['penNumber']!,
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
                        row['penType']!,
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
                        row['pigs'].length.toString(),
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
                        row['maxPigCount']!.toString(),
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
