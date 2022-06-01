import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/screens/profile.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/equipment_form.dart';

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const InlineWidget(text: 'Equipment', subText: '2 Diesel'),
              SplashIcon(
                  icon: SvgPicture.asset('lib/assets/icons/edit.svg'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Profile()));
                  })
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
                    child: Container(
                      width: 350.w,
                      height: 175.h,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(bottom: 10.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              'lib/assets/icons/${images[index]}.svg'),
                          Text(myProducts[index],
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 0.56,
                                  color: ColorUtil.primaryColor)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: ColorUtil.tabWhiteColor,
                          borderRadius: BorderRadius.circular(16.r)),
                    ),
                  );
                }),
          ),
        ]));
  }
}
