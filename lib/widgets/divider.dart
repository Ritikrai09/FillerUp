import 'package:filler_up/colors/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen.dart';

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
            height: ScreenSize.isSmall(context)
                ? MediaQuery.of(context).size.height * 0.064
                : ScreenSize.isTabletWidth(context)
                    ? MediaQuery.of(context).size.height * 0.054
                    : MediaQuery.of(context).size.height * 0.034,
            child: Center(
                child: Text('OR',
                    style: TextStyle(
                        fontSize:
                            ScreenSize.isTabletWidth(context) ? 13.sp : 15.sp,
                        color: ColorUtil.lightPrimaryColor,
                        fontWeight: FontWeight.w600))),
            decoration: const BoxDecoration(color: ColorUtil.primaryColor),
          ),
        ),
      ],
    );
  }
}
