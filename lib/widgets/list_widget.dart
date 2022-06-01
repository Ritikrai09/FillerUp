import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../colors/color_util.dart';

class ListWidget extends StatelessWidget {
  final double? width, height;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Widget? icon;
  final String? text, subText;
  final bool isSeen;
  final Color? iconBgColor;
  final TextStyle? textStyle, subTextStyle;
  final bool isSubText;
  final double? sizeHeight, iconWidth, iconRadius, subTextWidth;

  final bool isIcon;
  const ListWidget(
      {Key? key,
      this.onTap,
      this.margin,
      this.width,
      this.height,
      this.iconBgColor,
      this.icon,
      this.isSubText = false,
      this.isSeen = false,
      this.text,
      this.iconRadius,
      this.isIcon = true,
      this.subText,
      this.textStyle,
      this.iconWidth,
      this.sizeHeight,
      this.subTextStyle,
      this.subTextWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 335.w,
      height: height ?? 50.h,
      margin: margin ?? EdgeInsets.only(top: 15.h),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              onTap: onTap ?? () {},
              child: Center(
                  child: SizedBox(
                width: width ?? 335.w,
                height: 76.h,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isIcon
                          ? Container(
                              width: iconWidth ?? 47.w,
                              height: iconWidth ?? 47.w,
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(iconRadius ?? 8.sp)),
                                  color: iconBgColor ?? Colors.transparent),
                              child: icon ??
                                  SvgPicture.asset('lib/assets/icons/bell.svg',
                                      width: 20.w,
                                      height: 20.h,
                                      color: isSeen
                                          ? ColorUtil.lightPrimaryColor
                                          : Colors.white))
                          : const SizedBox(),
                      SizedBox(width: 15.w),
                      Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: subTextWidth ?? 220.w,
                              child: Column(
                                mainAxisAlignment: isSubText
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      text ??
                                          'Your order has been generated successfully.Please click...',
                                      style: textStyle ??
                                          TextStyle(
                                              fontSize: 13.5.sp,
                                              height: 1.4.h,
                                              fontFamily: 'Gotham',
                                              fontWeight: FontWeight.w600,
                                              color: isSeen
                                                  ? ColorUtil.lightPrimaryColor
                                                  : Colors.white)),
                                  isSubText
                                      ? SizedBox(
                                          height: sizeHeight ?? 10.h,
                                        )
                                      : const SizedBox(),
                                  isSubText
                                      ? Text('$subText',
                                          style: subTextStyle ??
                                              TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: 'Gotham',
                                                color:
                                                    ColorUtil.lightPrimaryColor,
                                              ))
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
              ))),
        ),
      ),
    );
  }
}
