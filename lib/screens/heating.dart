import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/screens/home.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/screen.dart';

class HeatingOil extends StatefulWidget {
  const HeatingOil({Key? key}) : super(key: key);

  @override
  State<HeatingOil> createState() => _HeatingOilState();
}

class _HeatingOilState extends State<HeatingOil> {
  final List<String> myProducts = [
    'HEATING OIL',
  ];
  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      patternBackground: true,
      child: Column(children: [
        const TopAppBar(),
        SizedBox(
          height: defaultSize / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding:  EdgeInsets.only(left: 5),
              child: InlineWidget(text: 'Heating Oil', isSubText: false),
            ),
            Transform.scale(
                scale: ScreenSize.isSmall(context) ? 1.sp : 1.00000001.sp,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'lib/assets/icons/edit.svg',
                  ),
                ))
          ],
        ),
        Expanded(child: gridWidget)
      ]),
    );
  }

  Widget get gridWidget {
    var screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: myProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const Home()));
            },
            child: Container(
              width: screenSize.width * 0.935,
              height: ScreenSize.isSmall(context)
                  ? ScreenSize.isVerySmall(context)
                      ? screenSize.height * 0.265
                      : screenSize.height * 0.240
                  : ScreenSize.isSmallWidth(context)
                      ? screenSize.height * 0.215
                      : ScreenSize.isSmallWidth(context)
                          ? screenSize.height * 0.215
                          : screenSize.height * 0.207,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                      scale: ScreenSize.isSmall(context)
                          ? 0.7.sp
                          : ScreenSize.isSmallWidth(context)
                              ? 0.705.sp
                              : ScreenSize.isTabletWidth(context)
                                  ? 0.735.sp
                                  : 1.0.sp,
                      child:
                          SvgPicture.asset('lib/assets/icons/heating.svg')),
                  Text(myProducts[index],
                      style: TextStyle(
                          fontSize: ScreenSize.isSmall(context)
                              ? 14.sp
                              : ScreenSize.isTabletWidth(context)
                                  ? 12.sp
                                  : 16.sp,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                          height: 0.56,
                          color: ColorUtil.primaryColor)),
                ],
              ),
              decoration: BoxDecoration(
                  color: isSelected == index
                      ? ColorUtil.tabHighlightColor
                      : ColorUtil.tabWhiteColor,
                  borderRadius: BorderRadius.circular(16.r)),
            ),
          );
        });
  }
}
