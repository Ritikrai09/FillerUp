import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_util.dart';
import 'screen.dart';

class CheckBox extends StatefulWidget {
  final bool isChecked;
  final String? text;
  final VoidCallback onTap;
  const CheckBox(
      {Key? key, this.isChecked = false, this.text, required this.onTap})
      : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: ScreenSize.isTabletHeight(context)
              ? MediaQuery.of(context).size.width * 0.09
              : MediaQuery.of(context).size.width * 0.10,
          height: ScreenSize.isSmall(context)
              ? MediaQuery.of(context).size.height * 0.050
              : ScreenSize.isSmallHeight(context)
                  ? MediaQuery.of(context).size.height * 0.040
                  : MediaQuery.of(context).size.height * 0.045,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 20.h),
          child: GestureDetector(
            onTap: widget.onTap,
            child: FittedBox(
              fit: BoxFit.fill,
              child: AnimatedContainer(
                width: ScreenSize.isTabletHeight(context)
                    ? MediaQuery.of(context).size.width * 0.155
                    : MediaQuery.of(context).size.width * 0.087,
                height: ScreenSize.isSmall(context)
                    ? MediaQuery.of(context).size.height * 0.050
                    : ScreenSize.isTabletWidth(context)
                        ? MediaQuery.of(context).size.height * 0.050
                        : MediaQuery.of(context).size.height * 0.040,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 0, 8.w, 5.h),
                margin: EdgeInsets.only(bottom: 7.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3.r))),
                duration: const Duration(milliseconds: 500),
                child: widget.isChecked
                    ? Transform.scale(
                        scale: ScreenSize.isTabletWidth(context) ? 3 : 1,
                        child: const Center(
                            child: Icon(
                          Icons.check_sharp,
                          color: ColorUtil.primaryColor,
                        )),
                      )
                    : null,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 13.h),
          child: Text(widget.text ?? 'FillerUp tank',
              style: TextStyle(
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.w600,
                  height: ScreenSize.isSmallHeight(context) ? 2.8.h : 1.h,
                  fontSize: ScreenSize.isSmall(context) ? 12.sp : 15.sp,
                  fontFamily: 'Gotham',
                  color: Colors.white)),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
