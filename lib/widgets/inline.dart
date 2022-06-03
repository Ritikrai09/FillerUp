import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen.dart';

class InlineWidget extends StatelessWidget {
  final String? text, subText;
  final Color? color;
  final double? size;
  final bool isSubText;
  final TextStyle? textStyle, subTextStyle;
  final Alignment? align;
  const InlineWidget(
      {Key? key,
      this.size,
      this.text,
      this.subText,
      this.isSubText = true,
      this.color,
      this.textStyle,
      this.align,
      this.subTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(
        alignment: align ?? Alignment.centerLeft,
        child: Text(text ?? 'Welcome',
            style: textStyle ??
                TextStyle(
                    fontSize: ScreenSize.isVerySmall(context)
                        ? ScreenSize.isSmallHeight(context)
                            ? 21.sp
                            : 18.sp
                        : ScreenSize.isTabletWidth(context)
                            ? 16.sp
                            : 22.sp,
                    height: ScreenSize.isSmall(context) ? 2.4.h : 1.h,
                    fontFamily: 'Gotham-Bold',
                    color: color ?? Colors.white)),
      ),
      isSubText
          ? SizedBox(height: ScreenSize.isVerySmall(context) ? 24.h : 10.h)
          : SizedBox(height: 0.h),
      isSubText
          ? Column(
              children: [
                SizedBox(
                  height: ScreenSize.isSmallWidth(context)
                      ? 42.h
                      : ScreenSize.isTabletWidth(context)
                          ? 50.h
                          : 32.h,
                  child: Text(subText ?? 'Need a helping hand today ?',
                      maxLines: 2,
                      style: subTextStyle ??
                          TextStyle(
                              fontFamily: 'Gotham',
                              height: ScreenSize.isSmall(context)
                                  ? ScreenSize.isSmall(context)
                                      ? 2.6.h
                                      : 2.h
                                  : 1.8.h,
                              fontSize: ScreenSize.isSmall(context)
                                  ? ScreenSize.isVerySmall(context)
                                      ? 12.sp
                                      : 14.5.sp
                                  : ScreenSize.isSmallWidth(context)
                                      ? 12.sp
                                      : ScreenSize.isTabletWidth(context)
                                          ? 13.sp
                                          : 15.5.sp,
                              color: color ?? Colors.white)),
                ),
                SizedBox(height: 20.h)
              ],
            )
          : const SizedBox()
    ]);
  }
}
