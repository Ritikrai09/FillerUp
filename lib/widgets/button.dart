import 'package:filler_up/colors/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 320.w,
      height: 55.h,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)))),
      child: ElevatedButton(
          onPressed: onPressed,
          child: child ??
              Center(
                child: Text(text!,
                    style: style ??
                        const TextStyle(
                            fontFamily: 'Gotham',
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
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
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5.sp)))),
    );
  }
}
