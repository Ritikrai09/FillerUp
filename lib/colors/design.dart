import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_util.dart';

class Design extends StatelessWidget {
  final Widget child;
  const Design({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 814.h,
      decoration: const BoxDecoration(color: ColorUtil.primaryColor),
      child: Stack(
        children: [
          const ColoredBox(color: ColorUtil.primaryColor),
          SvgPicture.asset('lib/assets/logo/design.svg'),
          child
        ],
      ),
    );
  }
}
