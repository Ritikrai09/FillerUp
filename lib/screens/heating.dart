import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/screens/home.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const InlineWidget(text: 'Heating Oil', isSubText: false),
            SvgPicture.asset('lib/assets/icons/edit.svg'),
          ],
        ),
        gridWidget
      ]),
    );
  }

  Widget get gridWidget {
    return Expanded(
      child: ListView.builder(
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const Home()));
              },
              child: Container(
                width: 350.w,
                height: 175.h,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('lib/assets/icons/heating.svg'),
                    Text(myProducts[index],
                        style: TextStyle(
                            fontSize: 16.sp,
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
          }),
    );
  }
}
