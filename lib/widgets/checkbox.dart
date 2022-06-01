import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_util.dart';

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
          width: 40.w,
          height: 30.h,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 20.h),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              width: 25.w,
              height: 25.h,
              padding: EdgeInsets.fromLTRB(0, 0, 8.w, 5.h),
              margin: EdgeInsets.only(bottom: 7.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(3.r))),
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
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 13.h),
          child: Text(widget.text ?? 'FillerUp tank',
              style:
                  const TextStyle(fontFamily: 'Gotham', color: Colors.white)),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
