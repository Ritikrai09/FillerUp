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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          child: GestureDetector(
            onTap: widget.onTap,
            child: FittedBox(
              fit: BoxFit.fill,
              child: AnimatedContainer(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                duration: const Duration(milliseconds: 500),
                child: widget.isChecked
                    ? const Center(
                        child: Icon(
                      Icons.check_sharp,
                      color: ColorUtil.primaryColor,
                    ))
                    : null,
              ),
            ),
          ),
        ),
        Text(widget.text ?? 'FillerUp tank',
            style: TextStyle(
                letterSpacing: 0.3,
                fontWeight: FontWeight.w600,
                fontSize: ScreenSize.isSmall(context) ? 12.sp : 15.sp,
                fontFamily: 'Gotham',
                color: Colors.white)),
        SizedBox(height: 10.h),
      ],
    );
  }
}
