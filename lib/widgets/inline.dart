import 'package:filler_up/config/common_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen.dart';

class InlineWidget extends StatelessWidget {
  final String? text, subText;
  final Color? color;
  final double? size;
  final double? spaceBetweenText;
  final bool isSubText;
  final TextStyle? textStyle, subTextStyle;
  final Alignment? align;
  const   InlineWidget(
      {Key? key,
      this.size,
      this.text,
      this.subText,
      this.isSubText = true,
      this.color,
      this.textStyle,
      this.align,
      this.subTextStyle,
      this.spaceBetweenText})
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

                    fontFamily: 'Gotham-Bold',
                    color: color ?? Colors.white)),
      ),
      SizedBox(height: defaultSize/2,),
      isSubText
          ? Column(
              children: [
                Text(subText ?? 'Need a helping hand today ?',
                    maxLines: 2,
                    style: subTextStyle ??
                        TextStyle(
                            fontFamily: 'Gotham',
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
                SizedBox(height: 20.h)
              ],
            )
          : const SizedBox()
    ]);
  }
}
