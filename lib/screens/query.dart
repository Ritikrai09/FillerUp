import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';
import 'dart:math' as math;
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/screen.dart';

class Query extends StatefulWidget {
  const Query({Key? key}) : super(key: key);

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  bool isExpand = false;

  final List<String> _list = [
    'ffndfdsndkdjskkfshkvjcfhndkjsfhnjkdfnskjfhnskfjvhsnfkjvh ',
    'ffndfdsndkdjskjfkkdhfjbvkhnfkhdfkhfkfnk;sjfhsnfjkjhnsfjkhsnfjkshfkjshf',
    'ffndfdsndkdjskjhoiflkjdiofsfjihdijfshfiuskfhiusfhiusfhvsiufvhjsoifvjfoidkhfnviuudfhbidgjbdiogbhdigbhdgibudhgbidghbidugh',
    'ffndfdsndkdjskkdjosfljvsoifvnfvkhnfivfoivjfoivjfoijfjvknjnvkjcvnckjvckvnkjcnjknvsdkjvoifvjoifjpojvposfjjovsjvoijoijoijfiovjsoifjfoi',
    'dkfgjifoooooooooodkflsmfjdfjdbiugholkjoih'
  ];
  double height = 200.h;
  double stretchHeight = 0;
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      patternBackground: true,
      child: Column(
        children: [
          const TopAppBar(),
          SizedBox(height: ScreenSize.isSmall(context) ? 0.h : 10.h),
          const InlineWidget(
              align: Alignment.topLeft,
              text: 'Frequently Asked Questions',
              isSubText: false),
          SizedBox(
            height: defaultSize / 2,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
                'Welcome to our support center. Here you can find the most frequently asked questions.',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize:
                        defaultSize,
                    fontFamily: 'Gotham',
                    color: Colors.white.withOpacity(0.8))),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              padding: EdgeInsets.all(5.sp),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) => expandList(index, isExpand = selectIndex == index, () {
                  setState(() {
                    selectIndex = index;
                    stretchHeight = 200;
                  });
                }, _list[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget expandList(
      int index, bool isExpand, VoidCallback onPressed, String child) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: isExpand ? 0.8.w : 0.w,
                        color: isExpand
                            ? ColorUtil.lightPrimaryColor
                            : Colors.transparent))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: ScreenSize.isVerySmall(context)
                        ? const EdgeInsets.all(5.0)
                        : const EdgeInsets.all(8.0),
                    child: Text('What is Lorem Ipsum?',
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: defaultSize,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w600,
                            color: ColorUtil.primaryColor)),
                  ),
                ),
                isExpand
                    ? IconButton(
                        onPressed: onPressed,
                        icon: SvgPicture.asset(
                            'lib/assets/icons/down.svg'))
                    : Transform.rotate(
                      angle: math.pi / 1.0,
                      child: IconButton(
                          onPressed: onPressed,
                          icon: SvgPicture.asset(
                              'lib/assets/icons/down.svg')),
                    )
              ],
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(10.sp),
            duration: const Duration(milliseconds: 400),
            constraints:
                BoxConstraints(maxHeight: isExpand ? stretchHeight : 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  child,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500]),
                ))
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
    );
  }
}
