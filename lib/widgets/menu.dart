import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/color_util.dart';
import 'screen.dart';

class SplashIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? icon;
  final double? size, height;
  final Color? materialColor, color;
  const SplashIcon(
      {Key? key,
      this.materialColor,
      this.color,
      this.onPressed,
      this.icon,
      this.size,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 0.w),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: IconButton(
            icon: icon ?? SvgPicture.asset('lib/assets/icons/menu.svg'),
            iconSize: size ?? 21.sp,
            color: materialColor ?? ColorUtil.primaryColor,
            splashRadius: 18.sp,
            splashColor: ColorUtil.tabWhiteColor,
            padding: EdgeInsets.all(10.sp),
            onPressed: onPressed ??
                () {
                  Navigator.pop(context);
                },
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? Colors.transparent,
          ),
        ),
      ),
    );
  }
}
