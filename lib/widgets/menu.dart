import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/color_util.dart';

class SplashIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? icon;
  final double? size;
  final Color? materialColor;
  const SplashIcon(
      {Key? key, this.materialColor, this.onPressed, this.icon, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 44.w,
      margin: EdgeInsets.only(right: 0.w),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: IconButton(
            icon: icon ?? SvgPicture.asset('lib/assets/icons/menu.svg'),
            iconSize: size ?? 24.sp,
            color: materialColor ?? ColorUtil.primaryColor,
            splashRadius: 18.sp,
            splashColor: ColorUtil.tabWhiteColor,
            padding: EdgeInsets.all(8.sp),
            onPressed: onPressed ??
                () {
                  Navigator.pop(context);
                },
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: materialColor ?? Colors.transparent,
          ),
        ),
      ),
    );
  }
}
