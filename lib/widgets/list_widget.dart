import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../colors/color_util.dart';
import 'screen.dart';

class ListWidget extends StatefulWidget {
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
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: widget.width ?? 335.w,
      height: widget.height,
      margin: ScreenSize.isTabletWidth(context)
          ? EdgeInsets.only(top: 0.h)
          : widget.margin ?? EdgeInsets.only(top: 10.h),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              onTap: widget.onTap ?? () {},
              child: Container(
                width: widget.width ?? 335.w,
                height: ScreenSize.isSmall(context)
                    ? ScreenSize.isTabletHeight(context)
                        ? screenSize.height * 0.205
                        : ScreenSize.isVerySmall(context)
                            ? screenSize.height * 0.205
                            : screenSize.height * 0.105
                    : widget.height ?? screenSize.height * 0.094,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.isIcon
                          ? Container(
                              margin: EdgeInsets.only(top: 10.h),
                              padding: ScreenSize.isSmall(context)
                                  ? EdgeInsets.all(8.sp)
                                  : ScreenSize.isSmallWidth(context)
                                      ? EdgeInsets.all(8.sp)
                                      : ScreenSize.isTabletWidth(context)
                                          ? EdgeInsets.all(8.sp)
                                          : EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          widget.iconRadius ?? 8.sp)),
                                  color:
                                      widget.iconBgColor ?? Colors.transparent),
                              child: widget.icon ??
                                  SvgPicture.asset('lib/assets/icons/bell.svg',
                                      width: 20.w,
                                      height: 20.h,
                                      color: widget.isSeen
                                          ? ColorUtil.lightPrimaryColor
                                          : Colors.white))
                          : const SizedBox(),
                      SizedBox(width: 15.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widget.subTextWidth ?? 220.w,
                            child: Column(
                              mainAxisAlignment: widget.isSubText
                                  ? MainAxisAlignment.start
                                  : ScreenSize.isTabletWidth(context)
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    widget.text ??
                                        'Your order has been generated successfully.Please click...',
                                    style: widget.textStyle ??
                                        TextStyle(
                                            fontSize: ScreenSize.isVerySmall(
                                                    context)
                                                ? 12.8.sp
                                                : ScreenSize.isTabletWidth(
                                                        context)
                                                    ? 12.sp
                                                    : ScreenSize.isTabletHeight(
                                                            context)
                                                        ? ScreenSize.isSmall(
                                                                context)
                                                            ? 10.sp
                                                            : 14.sp
                                                        : 13.5.sp,
                                            height:
                                                ScreenSize.isVerySmall(context)
                                                    ? 3.h
                                                    : ScreenSize.isTabletHeight(
                                                            context)
                                                        ? 1.8.h
                                                        : 2.4.h,
                                            fontFamily:
                                                ScreenSize.isTabletWidth(
                                                        context)
                                                    ? 'Gotham'
                                                    : 'Gotham-Bold',
                                            letterSpacing: 0.3,
                                            color: widget.isSeen
                                                ? ColorUtil.lightPrimaryColor
                                                : Colors.white)),
                                widget.isSubText
                                    ? SizedBox(
                                        height: widget.sizeHeight ?? 10.h,
                                      )
                                    : const SizedBox(),
                                widget.isSubText
                                    ? Text('${widget.subText}',
                                        style: widget.subTextStyle ??
                                            TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'Gotham',
                                              color:
                                                  ColorUtil.lightPrimaryColor,
                                            ))
                                    : const SizedBox(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ]),
              )),
        ),
      ),
    );
  }
}
