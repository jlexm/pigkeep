import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class DisposalLedger extends StatefulWidget {
  const DisposalLedger({super.key});

  @override
  State<DisposalLedger> createState() => _DisposalLedgerState();
}

class _DisposalLedgerState extends State<DisposalLedger> {
  final List<Map<String, dynamic>> transactionMedcaDisposalLedger = [
    {
      'date': 'Today',
      'time': '08:00 AM',
      'id': '005',
      'weight': 95,
      'status': 'Sold',
      'price': 1000,
    },
    {
      'date': 'Jul 24, 2024',
      'time': '09:30 AM',
      'id': '006',
      'weight': 85,
      'status': 'Deceased',
      'price': 0,
    },
    {
      'date': 'Jul 23, 2024',
      'time': '07:45 AM',
      'id': '007',
      'weight': 95,
      'status': 'Sold',
      'price': 1500,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: transactionMedcaDisposalLedger.length,
            itemBuilder: (context, index) {
              final transaction = transactionMedcaDisposalLedger[index];
              final isSold = transaction['status'] == 'Sold';
              final statusColor = isSold ? appPrimary : appRed;

              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: appSecondary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            transaction['date']!,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),

                      // Second Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction['status']!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (isSold)
                            Text(
                              '\₱${transaction['price']}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),

                      // Third Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Pig ',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: appTertiary,
                                  ),
                                ),
                                TextSpan(
                                  text: transaction['id'],
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: transaction['status'] == 'Sold'
                                        ? appPrimary
                                        : appRed,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isSold)
                            Text(
                              '${transaction['weight']}kg',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: appPrimary,
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
        ),
      ],
    );
  }
}
