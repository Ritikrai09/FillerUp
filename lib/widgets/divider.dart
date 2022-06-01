import 'package:filler_up/colors/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(thickness: 2.h, color: ColorUtil.lightPrimaryColor),
        Center(
          child: Container(
            width: 40.w,
            height: 20.h,
            child: const Center(
                child: Text('OR',
                    style: TextStyle(
                        color: ColorUtil.lightPrimaryColor,
                        fontWeight: FontWeight.w600))),
            decoration: const BoxDecoration(color: ColorUtil.primaryColor),
          ),
        ),
      ],
    );
  }
}
