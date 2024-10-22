import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Services/pig-helper.dart';

class TransactionMedicalrecords extends StatefulWidget {
  final List<Map<String, dynamic>> medHistory;
  const TransactionMedicalrecords({super.key, required this.medHistory});

  @override
  State<TransactionMedicalrecords> createState() =>
      _TransactionMedicalrecordsState();
}

class _TransactionMedicalrecordsState extends State<TransactionMedicalrecords> {
  void _onNotificationTap(String id, String textId) {}

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = widget.medHistory.length * itemHeight;

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: containerHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.medHistory.length,
        itemBuilder: (context, index) {
          final transaction = widget.medHistory[index];
          final isAddFeed = transaction['status'] == 'stock';
          final statusColor = isAddFeed ? appBlue : appRed;

          return Padding(
            padding: EdgeInsets.only(bottom: 21.h),
            child: Container(
              decoration: BoxDecoration(
                color: appSecondary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        PigHelper.formatDate(transaction['createdAt']),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        PigHelper.formatToHour(transaction['createdAt']),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${PigHelper.convertVolume(transaction['quantity'], transaction['unit'])}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' ${transaction['medicineName']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${transaction['pigNumber'] ?? ''}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        transaction['status']!,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: statusColor,
                        ),
                      ),
                      if (isAddFeed)
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  '${PigHelper.formatCurrency(transaction['cost'])}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: statusColor,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
