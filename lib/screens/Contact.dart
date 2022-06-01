import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_bar.dart';
import '../widgets/inline.dart';
import '../widgets/main_box.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(children: [
          const TopAppBar(),
          const InlineWidget(text: 'Contact Us', isSubText: false),
          ListWidget(
            width: 340.w,
            height: 100.h,
            sizeHeight: 10.h,
            iconRadius: 18.r,
            icon: SvgPicture.asset('lib/assets/icons/call.svg',
                width: 30.w, height: 30.h),
            iconBgColor: ColorUtil.primaryOrangeColor,
            text: 'Same Day & After Hours Deliveries',
            isSubText: true,
            subTextWidth: 250.w,
            textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gotham',
                color: ColorUtil.lightPrimaryColor),
            subTextStyle: TextStyle(
                fontSize: 22.sp,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w600,
                color: Colors.white),
            subText: '203.600.9425',
          ),
          SizedBox(height: 10.h),
          InlineWidget(
            text: 'Operating Hours',
            textStyle: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w600,
                color: Colors.white),
            subText: 'Monday - Saturday 8.00 am - 6.00 pm',
            subTextStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w600,
                color: ColorUtil.lightPrimaryColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(' Sunday - 9.00 am - 5.00 pm',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w600,
                      color: ColorUtil.lightPrimaryColor)),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          InlineWidget(
              text: 'Social Media',
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              isSubText: false),
          ListWidget(
            iconWidth: 35.w,
            iconBgColor: const Color.fromRGBO(34, 142, 154, 1),
            icon: SvgPicture.asset(
              'lib/assets/social/fb.svg',
              color: Colors.white,
            ),
            text: 'Facebook',
            textStyle: const TextStyle(
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w600,
                color: ColorUtil.lightPrimaryColor),
          ),
          SizedBox(height: 10.h),
          Row(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: ColorUtil.primaryBackground,
              ),
              child: SvgPicture.asset(
                'lib/assets/social/instagram.svg',
                color: Colors.white,
              ),
            ),
            const Text('Instagram',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Gotham',
                    color: ColorUtil.lightPrimaryColor))
          ]),
          SizedBox(height: 40.h),
          ButtonWidget(
            onPressed: () {},
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w600),
            text: 'Order Online Today!',
          )
        ]));
  }
}
