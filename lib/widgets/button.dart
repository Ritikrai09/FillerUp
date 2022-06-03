import 'package:filler_up/colors/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String? text;
  final TextStyle? style;
  final Color? color;
  final Widget? child;
  final String? image;

  const ButtonWidget(
      {Key? key,
      this.icon,
      this.text,
      this.style,
      this.color,
      this.child,
      required this.onPressed,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.isSmall(context)
          ? MediaQuery.of(context).size.height * 0.084
          : ScreenSize.isTabletWidth(context)
              ? MediaQuery.of(context).size.height * 0.090
              : MediaQuery.of(context).size.height * 0.068,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)))),
      child: ElevatedButton(
          onPressed: onPressed,
          child: child ??
              Center(
                child: Text(text!,
                    style: style ??
                        TextStyle(
                          fontSize: ScreenSize.isTabletWidth(context)
                              ? 12.sp
                              : ScreenSize.isVerySmall(context)
                                  ? 12.sp
                                  : 16.sp,
                          fontFamily: 'Gotham-Bold',
                          color: Colors.white,
                        )),
              ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              )),
              overlayColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.pressed)
                      ? const Color.fromRGBO(0, 53, 255, 0.1)
                      : Colors.transparent;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) =>
                      color ?? ColorUtil.primaryOrangeColor),
              elevation: MaterialStateProperty.resolveWith<double>(
                  (Set<MaterialState> states) => 0),
              textStyle: MaterialStateProperty.all(TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'Gotham-Bold',
                  letterSpacing: 0.5.sp)))),
    );
  }
}
