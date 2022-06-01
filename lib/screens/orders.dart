import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_util.dart';
import '../widgets/app_bar.dart';
import '../widgets/inline.dart';
import '../widgets/main_box.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<String> lists = [
    'lib/assets/icons/order1.png',
    'lib/assets/icons/order2.png'
  ];
  List<String> list1 = ['Heating Oil', 'Regular Unleashed Gas (87 Octane)'];
  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(children: [
          const TopAppBar(),
          const InlineWidget(text: 'Order History', isSubText: false),
          Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return listWrap(
                        image: lists[index],
                        text: list1[index]); //ListWrap(image: ),
                  }))
        ]));
  }

  Container listWrap({String? image, String? text}) {
    return Container(
      width: 335.w,
      height: 110.h,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          color: ColorUtil.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(16.r))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Image.asset(image!, width: 100.w, height: 70.h),
          ),
          Container(
            width: 220.w,
            padding: EdgeInsets.all(4.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      text!,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '100 Gallon Minimum and delivery within 3 days of order',
                    softWrap: true,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 12.5.sp,
                        height: 1.3.h,
                        fontFamily: 'Gotham',
                        color: ColorUtil.lightPrimaryColor),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price - \$5.69',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        'Quantity - 01',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
