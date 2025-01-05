import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_keep/Classes/DropDownItem.dart';
import 'package:pig_keep/Components/Carousel_FeedInventory.dart';
import 'package:pig_keep/Components/Transaction_FeedInventory.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/feed-history.dart';
import 'package:pig_keep/Models/feed.dart';
import 'package:pig_keep/Providers/global_provider.dart';
import 'package:pig_keep/Services/feed-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';
import 'package:provider/provider.dart';

class FeedInventory extends StatefulWidget {
  const FeedInventory({super.key});
  @override
  State<FeedInventory> createState() => _FeedInventoryState();
}

class _FeedInventoryState extends State<FeedInventory> {
  //services
  final feedService = globalLocator.get<FeedService>();

  // controllers
  final TextEditingController _feedTypeCtrl = TextEditingController();
  final TextEditingController _weightKGCtrl = TextEditingController();
  final TextEditingController _costCtrl = TextEditingController();

  // vars
  var selectedFarm;
  late String userOwner;
  List<Feed> feeds = [];
  List<FeedHistory> feedHistory = [];

  // functions
  Future<void> fetchFeedData() async {
    final feedTypes = await feedService.getFeeds(selectedFarm['_id']);
    final feedH = await feedService.getFeedsTransactions(selectedFarm['_id']);
    setState(() {
      feeds = feedTypes;
      feedHistory = feedH;
    });
  }

  @override
  void initState() {
    context.read<GlobalProvider>().getCurrentUser().then((user) {
      selectedFarm = context.read<GlobalProvider>().getSelectedFarm();
      userOwner = user['username'];
      fetchFeedData();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final farm = context.watch<GlobalProvider>().getSelectedFarm();
    setState(() {
      selectedFarm = farm;
    });
    fetchFeedData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Container(
                  height: 57.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: appPrimary, width: 1.5),
                    color: appSecondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReusableDialogBox(
                            title: 'Consume Feed',
                            description: 'Fill up the necessary information.',
                            formFields: [
                              RecyclableTextFormField(
                                controller: _feedTypeCtrl,
                                labelText: 'Feed Type',
                                showDropdown: true,
                                dropdownItems: feeds
                                    .map((feed) => CustomDropDownItem(
                                        feed.feedType,
                                        '${feed.feedType} | ${feed.weightKG}kg'))
                                    .toList(),
                                hintText: 'Feed Type',
                                hintTextSize: 14.sp,
                                icon: Icons.restaurant,
                                textSize: 14.sp,
                                readOnly: true,
                              ),
                              RecyclableTextFormField(
                                controller: _weightKGCtrl,
                                labelText: 'Weight in kg',
                                hintText: 'Weight in kg',
                                hintTextSize: 14.sp,
                                icon: Icons.scale,
                                textSize: 14.sp,
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                            onSave: () async {
                              try {
                                // perform consume mode
                                await feedService.addFeed(
                                  false,
                                  selectedFarm['_id'],
                                  'consumed',
                                  _feedTypeCtrl.text,
                                  double.parse(_weightKGCtrl.text),
                                  0,
                                );
                                await fetchFeedData();
                                context.pop();
                                _feedTypeCtrl.clear();
                                _weightKGCtrl.clear();
                              } catch (err) {
                                ToastService().showErrorToast(err.toString());
                              }
                            },
                            saveButtonText: 'Consume',
                            saveButtonColor: appRed,
                          );
                        },
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Minus.png',
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text('Consume',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: appTertiary,
                              ))
                        ]),
                  )),
            ),
            Expanded(
              child: Container(
                  height: 57.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: appPrimary, width: 1.5),
                    color: appPrimary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReusableDialogBox(
                            title: 'Add Feed',
                            description: 'Fill up the necessary information.',
                            formFields: [
                              RecyclableTextFormField(
                                controller: _feedTypeCtrl,
                                labelText: 'Feed Type',
                                hintText: 'Feed Type',
                                hintTextSize: 14.sp,
                                showDropdown: true,
                                dropdownItems: feeds
                                    .map((feed) => CustomDropDownItem(
                                        feed.feedType,
                                        '${feed.feedType} | ${feed.weightKG}kg'))
                                    .toList(),
                                icon: Icons.restaurant,
                                textSize: 14.sp,
                              ),
                              RecyclableTextFormField(
                                controller: _weightKGCtrl,
                                labelText: 'Weight in kg',
                                hintText: 'Weight in kg',
                                hintTextSize: 14.sp,
                                icon: Icons.scale,
                                textSize: 14.sp,
                                keyboardType: TextInputType.phone,
                              ),
                              RecyclableTextFormField(
                                controller: _costCtrl,
                                labelText: 'Cost',
                                hintText: 'Cost',
                                hintTextSize: 14.sp,
                                icon: Icons.price_change_rounded,
                                textSize: 14.sp,
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                            onSave: () async {
                              // Handle the save action, e.g., validate and save data
                              try {
                                await feedService.addFeed(
                                  false,
                                  selectedFarm['_id'],
                                  'stock',
                                  _feedTypeCtrl.text,
                                  double.parse(_weightKGCtrl.text),
                                  double.parse(_costCtrl.text),
                                );
                                await fetchFeedData();
                                context.pop();
                                _feedTypeCtrl.clear();
                                _weightKGCtrl.clear();
                                _costCtrl.clear();
                              } catch (err) {
                                ToastService().showErrorToast(err.toString());
                              }
                            },
                            saveButtonText: 'Add Feed',
                            saveButtonColor: appPrimary,
                          );
                        },
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Add.png',
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text('Add Feed',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: appSecondary,
                              ))
                        ]),
                  )),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        /* Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: SearchBar_FeedInventory(),
        ), //Searchbar_FeedInventory.dart */
        SizedBox(
          height: 18.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 15.w),
          child: CarouselFeedInventory(
            //Carousel_FeedIventory.dart
            items: feeds,
            farmID: selectedFarm['_id'],
            feedFeedData: fetchFeedData(), // Dynamic list of items
          ),
        ),
        SizedBox(
          height: 17.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        TransactionFeedInventory(
          feedHistory: feedHistory,
        ), //Transaction_FeedInventory.dart
        SizedBox(
          //remove this later
          height: 600.h,
        ),
        const Text('-End of SCSV-'),
        SizedBox(
          //remove this later
          height: 110.h,
        ),
      ],
    );
  }
}
