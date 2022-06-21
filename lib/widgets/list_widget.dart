import 'package:filler_up/config/common_size.dart';
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
    return SizedBox(
      height: widget.height,
      child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          onTap: widget.onTap ?? () {},
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.isIcon
                    ? Container(
                        padding: const EdgeInsets.all(10),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          widget.text ??
                              'Your order has been generated successfully.Please click...',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: widget.textStyle ??
                              TextStyle(
                                  fontSize: defaultSize*1.05,
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
                ),
              ])),
    );
  }
}
