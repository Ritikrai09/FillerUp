import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'equipment_form.dart';
import '../widgets/screen.dart';

class Equipment extends StatefulWidget {
  const Equipment({Key? key}) : super(key: key);

  @override
  State<Equipment> createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  final List<String> myProducts = ['ON ROAD DIESEL', 'OFF ROAD DIESEL'];
  final List<String> images = ['onRoad', 'offRoad'];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MainBoxWidget(
        patternBackground: true,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TopAppBar(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const InlineWidget(
                  text: 'Equipment', isSubText: true, subText: '2 Diesel'),
              Transform.scale(
                  scale: ScreenSize.isSmall(context) ? 1.sp : 1.0000000001.sp,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'lib/assets/icons/edit.svg',
                    ),
                  ))
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: myProducts.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const EquipmentForm()));
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        width: screenSize.width * 0.935,
                        height: ScreenSize.isSmall(context)
                            ? ScreenSize.isVerySmall(context)
                                ? screenSize.height * 0.257
                                : screenSize.height * 0.267
                            : ScreenSize.isSmallWidth(context)
                                ? screenSize.height * 0.287
                                : ScreenSize.isTabletWidth(context)
                                    ? screenSize.height * 0.267
                                    : screenSize.height * 0.217,
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 5.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Transform.scale(
                              scale: ScreenSize.isSmall(context)
                                  ? 0.7.sp
                                  : ScreenSize.isSmallWidth(context)
                                      ? 0.705.sp
                                      : ScreenSize.isTabletWidth(context)
                                          ? 0.735.sp
                                          : 1.0.sp,
                              child: SvgPicture.asset(
                                'lib/assets/icons/${images[index]}.svg',
                              ),
                            ),
                            Text(myProducts[index],
                                style: TextStyle(
                                    fontSize: ScreenSize.isSmall(context)
                                        ? 14.sp
                                        : ScreenSize.isTabletWidth(context)
                                            ? 12.sp
                                            : 16.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gotham',
                                    height: ScreenSize.isVerySmall(context)
                                        ? 1.8.h
                                        : 1.h,
                                    color: ColorUtil.primaryColor)),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: ColorUtil.tabWhiteColor,
                            borderRadius: BorderRadius.circular(16.r)),
                      ),
                    ),
                  );
                }),
          ),
        ]));
  }
}
