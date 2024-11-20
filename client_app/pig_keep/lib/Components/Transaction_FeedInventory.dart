import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Models/feed-history.dart';
import 'package:pig_keep/Services/pig-helper.dart';

class TransactionFeedInventory extends StatefulWidget {
  final List<FeedHistory> feedHistory;
  const TransactionFeedInventory({super.key, required this.feedHistory});

  @override
  State<TransactionFeedInventory> createState() =>
      _TransactionFeedInventoryState();
}

class _TransactionFeedInventoryState extends State<TransactionFeedInventory> {
  void _onNotificationTap(String id, String textId) {
    // Routing logic here
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = widget.feedHistory.length * itemHeight;

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: containerHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.feedHistory.length,
        itemBuilder: (context, index) {
          final transaction = widget.feedHistory[index];
          final isAddFeed = transaction.status == 'stock';
          final statusColor = isAddFeed ? appPrimary : appRed;
          final statusName = isAddFeed ? 'Add Feed' : 'Consume';

          final weightDisplay = isAddFeed
              ? '+${transaction.weightKG} kg'
              : '-${transaction.weightKG} kg';

          return Padding(
            padding: EdgeInsets.only(bottom: 21.h),
            child: InkWell(
              /*  onTap: () => _onNotificationTap(
                transaction['id']!,
                transaction['textId']!,
              ), */
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
                          PigHelper.formatDate(transaction.createdAt),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          PigHelper.formatToHour(transaction.createdAt),
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
                        Text(
                          transaction.feedType,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          weightDisplay,
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
                          statusName,
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
                                    PigHelper.formatCurrency(transaction.cost),
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
            ),
          );
        },
      ),
    );
  }
}
