import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';
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
    return MainBoxWidget(
        patternBackground: true,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TopAppBar(),
          SizedBox(height: defaultSize,),
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
              padding: EdgeInsets.zero,
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
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(defaultSize*1.5),
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 5.sp,bottom: defaultSize),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 150,
                              child: SvgPicture.asset(
                                'lib/assets/icons/${images[index]}.svg',fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: defaultSize*2,),
                            Text(myProducts[index],
                                style: TextStyle(
                                    fontSize: defaultSize*1.2,
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
