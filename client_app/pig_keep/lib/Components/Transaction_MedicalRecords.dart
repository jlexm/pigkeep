
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';

class TransactionMedicalrecords extends StatefulWidget {
  const TransactionMedicalrecords({super.key});

  @override
  State<TransactionMedicalrecords> createState() =>
      _TransactionMedicalrecordsState();
}

class _TransactionMedicalrecordsState extends State<TransactionMedicalrecords> {
  final List<Map<String, dynamic>> transactionMedcaTransactionMedicalrecords = [
    {
      'date': 'Today',
      'time': '08:00 AM',
      'id': '001',
      'textId': 'Monensin',
      'weight': 10,
      'status': 'Consume',
      'price': 0,
    },
    {
      'date': 'Jul 24, 2024',
      'time': '09:30 AM',
      'id': '002',
      'textId': 'Carbadox',
      'weight': 5,
      'status': 'Add Medicine',
      'price': 50,
    },
    {
      'date': 'Jul 23, 2024',
      'time': '07:45 AM',
      'id': '003',
      'textId': 'Furazolidone',
      'weight': 8,
      'status': 'Consume',
      'price': 0,
    },
  ];

  void _onNotificationTap(String id, String textId) {
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 80.h;
    final double containerHeight = transactionMedcaTransactionMedicalrecords.length * itemHeight;

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: containerHeight,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: transactionMedcaTransactionMedicalrecords.length,
        itemBuilder: (context, index) {
          final transaction = transactionMedcaTransactionMedicalrecords[index];
          final isAddFeed = transaction['status'] == 'Add Medicine';
          final statusColor = isAddFeed ? appBlue : appRed;

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
                        Row(
                          children: [
                            Text(
                              '${transaction['weight']} mg ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              transaction['textId']!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Pig ${transaction['id']}',
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
                            child: Text(
                              '\₱${transaction['price']}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: statusColor,
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
