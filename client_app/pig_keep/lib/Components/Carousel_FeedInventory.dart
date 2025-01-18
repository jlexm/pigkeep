import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Modals/ReusableDialogBox.dart';
import 'package:pig_keep/Models/feed.dart';

class CarouselFeedInventory extends StatefulWidget {
  final List<Feed> items;
  final Future<void> feedFeedData;
  final String farmID;
  final Future<void> Function(
      String feedUuid, String feedType, double weightKG, double cost) onUpdate;
  final Future<void> Function(String feedType, double weightKG, double cost)
      onFeedStock;

  const CarouselFeedInventory(
      {super.key,
      required this.items,
      required this.feedFeedData,
      required this.farmID,
      required this.onUpdate,
      required this.onFeedStock});

  @override
  State<CarouselFeedInventory> createState() => _CarouselFeedInventoryState();
}

class _CarouselFeedInventoryState extends State<CarouselFeedInventory> {
// controllers
  final TextEditingController _feedTypeCtrl = TextEditingController();
  final TextEditingController _weightKGCtrl = TextEditingController();
  final TextEditingController _costCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 15.h,
      ),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          padEnds: false,
          height: 90.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.46,
          initialPage: 1,
          enableInfiniteScroll: false,
          reverse: false,
          enlargeFactor: 0.01,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final Feed item = widget.items[index];

          return InkWell(
            child: Container(
                padding: EdgeInsets.all(3),
                width: MediaQuery.of(context).size.width * 0.35.w,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: appPrimary, width: 1.5.w),
                  color: appSecondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${item.weightKG} kg',
                                style: TextStyle(
                                    height: 0.9.h,
                                    fontSize: 22.sp,
                                    color: appPrimary,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                item.feedType.length > 15
                                    ? '${item.feedType.substring(0, 15)}...'
                                    : item.feedType,
                                style: TextStyle(fontSize: 12.0.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 20.sp,
                          color: appPrimary,
                        ),
                        onPressed: () {
                          _feedTypeCtrl.text = item.feedType;
                          _weightKGCtrl.text = '${item.weightKG}';
                          _costCtrl.text = '${item.cost}';

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ReusableDialogBox(
                                title: '${item.feedType} ${item.weightKG}',
                                description:
                                    'Enter the weight to add to the current stock of ${item.feedType}',
                                formFields: [
                                  RecyclableTextFormField(
                                    controller: _feedTypeCtrl,
                                    labelText: 'Feed Type',
                                    hintText: 'Feed Type',
                                    hintTextSize: 14.sp,
                                    icon: Icons.restaurant,
                                    textSize: 14.sp,
                                    readOnly: true,
                                    enabled: false,
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
                                  await widget.onFeedStock(
                                      item.feedType,
                                      double.parse(_weightKGCtrl.text),
                                      double.parse(_costCtrl.text));
                                },
                                saveButtonText: 'Save',
                                saveButtonColor: appBlue,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )),
            onTap: () {
              _feedTypeCtrl.text = item.feedType;
              _weightKGCtrl.text = '${item.weightKG}';
              _costCtrl.text = '${item.cost}';
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ReusableDialogBox(
                    title: 'Edit Feed',
                    description:
                        'Edit feed information. This will not be recorded as transactions.',
                    formFields: [
                      RecyclableTextFormField(
                        controller: _feedTypeCtrl,
                        labelText: 'Feed Type',
                        hintText: 'Feed Type',
                        hintTextSize: 14.sp,
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
                      await widget.onUpdate(
                          item.uuid,
                          _feedTypeCtrl.text,
                          double.parse(_weightKGCtrl.text),
                          double.parse(_costCtrl.text));
                    },
                    saveButtonText: 'Edit Feed',
                    saveButtonColor: appPrimary,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
