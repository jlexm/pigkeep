import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDataTable extends StatefulWidget {
  const MyDataTable({super.key});

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DataTable(
          columnSpacing: 8,
          columns: [
            DataColumn(
                headingRowAlignment: MainAxisAlignment.start,
                label: Text(
              'Number',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )),
            DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
                label: Text(
              'Category',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )),
            DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
                label: Text(
              'Feed',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )),
            DataColumn(
              headingRowAlignment: MainAxisAlignment.end,
                label: Text(
              'Pen Number',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Row 1, Col 1')),
              DataCell(Text('Row 1, Col 2')),
              DataCell(Text('Row 1, Col 3')),
              DataCell(Text('Row 1, Col 4')),
            ]),
            DataRow(cells: [
              DataCell(Text('Row 2, Col 1')),
              DataCell(Text('Row 2, Col 2')),
              DataCell(Text('Row 2, Col 3')),
              DataCell(Text('Row 2, Col 4')),
            ]),
            DataRow(cells: [
              DataCell(Text('Row 3, Col 1')),
              DataCell(Text('Row 3, Col 2')),
              DataCell(Text('Row 3, Col 3')),
              DataCell(Text('Row 3, Col 4')),
            ]),
          ],
        ),
      ),
    );
  }
}
