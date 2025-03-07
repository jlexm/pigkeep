import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class MyDataTable extends StatefulWidget {
  final List<Map<String, dynamic>> pigs;
  final void Function(Map<String, dynamic>)? onRowSelected;

  const MyDataTable({super.key, this.onRowSelected, required this.pigs});

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
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

  void _navigateToQRCodeStatus(
      BuildContext context, Map<String, String> rowData) {
    widget.onRowSelected!(rowData);
  }

  @override
  Widget build(BuildContext context) {
    // sort pigs based on status
    List<Map<String, dynamic>> sortedPigs = List.from(widget.pigs);
    sortedPigs.sort((a, b) {
      const statusPriority = {'alive': 0, 'sold': 1, 'deceased': 2};
      return statusPriority[a['status']]!
          .compareTo(statusPriority[b['status']]!);
    });

    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
            ),
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
              rows: sortedPigs.map((row) {
                return DataRow(
                  onSelectChanged: (_) {
                    widget.onRowSelected!(row);
                  },
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
                              row['pigNumber']!,
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
                          row['ageCategory']!,
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
                          row['currentFeed']!,
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
                          row['status'] == 'alive' ? row['penNumber']! : '--',
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
      ),
    );
  }
}
