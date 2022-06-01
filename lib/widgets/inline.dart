import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InlineWidget extends StatelessWidget {
  final String? text, subText;
  final Color? color;
  final double? size;
  final bool isSubText;
  final TextStyle? textStyle, subTextStyle;
  const InlineWidget(
      {Key? key,
      this.size,
      this.text,
      this.subText,
      this.isSubText = true,
      this.color,
      this.textStyle,
      this.subTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(text ?? 'Welcome',
            style: textStyle ??
                TextStyle(
                    fontSize: 22.sp,
                    height: 1.h,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.w600,
                    color: color ?? Colors.white)),
      ),
      isSubText ? SizedBox(height: 10.h) : SizedBox(height: 0.h),
      isSubText
          ? Text(subText ?? 'Need a helping hand today ?',
              maxLines: 2,
              style: subTextStyle ??
                  TextStyle(
                      fontFamily: 'Gotham',
                      letterSpacing: 0,
                      fontSize: 16.sp,
                      color: color ?? Colors.white))
          : const SizedBox()
    ]);
  }
}
