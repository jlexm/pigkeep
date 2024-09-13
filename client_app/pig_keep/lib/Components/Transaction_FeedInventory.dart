import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class TransactionFeedInventory extends StatefulWidget {
  const TransactionFeedInventory({super.key});

  @override
  State<TransactionFeedInventory> createState() =>
      _TransactionFeedInventoryState();
}

class _TransactionFeedInventoryState extends State<TransactionFeedInventory> {
  final List<Map<String, dynamic>> transactionFeedInventory = [
    {
      'date': 'Today',
      'time': '08:00 AM',
      'id': '001',
      'textId': 'Uno Grower',
      'weight': 10,
      'status': 'Consume',
      'price': 0,
    },
    {
      'date': 'Jul 24, 2024',
      'time': '09:30 AM',
      'id': '002',
      'textId': 'Uno Starter',
      'weight': 5,
      'status': 'Add Feed',
      'price': 50,
    },
    {
      'date': 'Jul 23, 2024',
      'time': '07:45 AM',
      'id': '003',
      'textId': 'Uno Pre-Starter',
      'weight': 8,
      'status': 'Consume',
      'price': 0,
    },
  ];

  void _onNotificationTap(String id, String textId) {
    // Routing logic here
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = transactionFeedInventory.length * itemHeight;

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: containerHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactionFeedInventory.length,
        itemBuilder: (context, index) {
          final transaction = transactionFeedInventory[index];
          final isAddFeed = transaction['status'] == 'Add Feed';
          final statusColor = isAddFeed ? appPrimary : appRed;

          final weightDisplay = isAddFeed
              ? '+${transaction['weight']} kg'
              : '-${transaction['weight']} kg';

          return Padding(
            padding: EdgeInsets.only(bottom: 21.h),
            child: InkWell(
              onTap: () => _onNotificationTap(
                transaction['id']!,
                transaction['textId']!,
              ),
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
                          transaction['date']!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          transaction['time']!,
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
                          transaction['textId']!,
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
                                children: [
                                  TextSpan(
                                    text: '₱', 
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight
                                          .w400, 
                                      color: statusColor,
                                      fontFamily:
                                          'Roboto', 
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${transaction['price']}', 
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight
                                          .w500, 
                                      color: statusColor,
                                      fontFamily:
                                          'Poppins', 
                                    ),
                                  ),
                                ],
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
