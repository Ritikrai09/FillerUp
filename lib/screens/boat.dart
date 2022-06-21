import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/screen.dart';

class Boat extends StatefulWidget {
  const Boat({Key? key}) : super(key: key);

  @override
  State<Boat> createState() => _BoatState();
}

class _BoatState extends State<Boat> {
  final List<String> myProducts = [
    'MARINE DIESEL',
    'MARINE GAS REGULAR',
    'MARINE GAS PREMIUM'
  ];
  final List<String> items = [];
  final List<String> images = ['offRoad', 'gas', 'onRoad'];
  int isSelected = -1;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    myProducts.map((index) => items.add(index)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopAppBar(trailing: Icons.arrow_back),
              SizedBox(
                height: defaultSize / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: InlineWidget(
                      text: 'Boat',
                      isSubText: false,
                    ),
                  ),
                  Transform.scale(
                      scale:
                          ScreenSize.isSmall(context) ? 1.sp : 1.0000000001.sp,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'lib/assets/icons/edit.svg',
                        ),
                      ))
                ],
              ),
              Expanded(child: gridWidget)
            ]));
  }

  Widget get gridWidget {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = index;
                });
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: screenSize.width * 0.935,
                  height: ScreenSize.isSmall(context)
                      ? ScreenSize.isVerySmall(context)
                      ? screenSize.height * 0.265
                      : screenSize.height * 0.195
                      : ScreenSize.isTabletHeight(context)
                      ? screenSize.height * 0.195
                      : ScreenSize.isSmallWidth(context)
                      ? screenSize.height * 0.225
                      : screenSize.height * 0.205,
                  alignment: ScreenSize.isVerySmall(context)
                      ? Alignment.topCenter
                      : Alignment.center,
                  margin: EdgeInsets.only(bottom: defaultSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Transform.scale(
                          scale: ScreenSize.isSmall(context)
                              ? 0.7.sp
                              : ScreenSize.isTabletHeight(context)
                              ? 1.2
                              : ScreenSize.isSmallWidth(context)
                              ? 0.735.sp
                              : ScreenSize.isTabletWidth(context)
                              ? 0.69.sp
                              : 0.9.sp,
                          child: SvgPicture.asset(
                              'lib/assets/icons/${images[index]}.svg')),
                      Text(items[index],
                          style: TextStyle(
                              fontSize: ScreenSize.isSmall(context)
                                  ? 14.sp
                                  : ScreenSize.isTabletWidth(context)
                                  ? 12.sp
                                  : 16.sp,
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.bold,
                              height: ScreenSize.isSmall(context)
                                  ? ScreenSize.isVerySmall(context)
                                  ? 1.h
                                  : 1.h
                                  : 1.6.h,
                              color: ColorUtil.primaryColor)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: isSelected == index
                          ? ColorUtil.tabHighlightColor
                          : ColorUtil.tabWhiteColor,
                      borderRadius: BorderRadius.circular(16.r)),
                ),
              ),
            );
          }),
    );
  }
}
