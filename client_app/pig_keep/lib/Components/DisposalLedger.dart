import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Services/pig-helper.dart';

class DisposalLedger extends StatefulWidget {
  final List<Map<String, dynamic>> ledgers;

  DisposalLedger({super.key, required this.ledgers});

  @override
  State<DisposalLedger> createState() => _DisposalLedgerState();
}

class _DisposalLedgerState extends State<DisposalLedger> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.ledgers.length,
            itemBuilder: (context, index) {
              final transaction = widget.ledgers[index];
              final isSold = transaction['status'] == 'sold';
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
                            PigHelper.formatDate(
                                transaction['transactionDate']),
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
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: transaction['priceSold'] != null
                                        ? PigHelper.formatCurrency(
                                            transaction['priceSold'])
                                        : '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'YourPriceFontFamily',
                                      color: appTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
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
                                  text: transaction['pigNumber'],
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: transaction['status'] == 'sold'
                                        ? appPrimary
                                        : appRed,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isSold)
                            Text(
                              transaction['weightKG'] != null
                                  ? '${transaction['weightKG']}kg'
                                  : '',
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
