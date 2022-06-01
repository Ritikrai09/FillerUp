import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InlineWidget(
                    text: 'Boat',
                    isSubText: false,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'lib/assets/icons/edit.svg',
                      ))
                ],
              ),
              gridWidget
            ]));
  }

  Widget get gridWidget {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = index;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(0, 0.h, 0, 10.h),
                width: 350.w,
                height: 175.h,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset('lib/assets/icons/${images[index]}.svg'),
                      Text(items[index],
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.bold,
                              height: 0.56.h,
                              color: ColorUtil.primaryColor)),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: isSelected == index
                        ? ColorUtil.tabHighlightColor
                        : ColorUtil.tabWhiteColor,
                    borderRadius: BorderRadius.circular(16.r)),
              ),
            );
          }),
    );
  }
}
