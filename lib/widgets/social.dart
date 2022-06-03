import 'package:filler_up/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialWidget extends StatelessWidget {
  final String? image;
  final Color? color;
  final bool isColored;
  const SocialWidget({Key? key, this.image, this.color, this.isColored = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: ScreenSize.isSmall(context)
          ? MediaQuery.of(context).size.height * 0.084
          : MediaQuery.of(context).size.height * 0.064,
      alignment: Alignment.center,
      padding: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: IconButton(
          padding: EdgeInsets.all(1.sp),
          alignment: Alignment.bottomRight,
          onPressed: () {},
          icon: isColored
              ? SvgPicture.asset(
                  image!,
                  color: color,
                  width: 80.w,
                  height: 80.h,
                )
              : SvgPicture.asset(
                  image!,
                  width: double.infinity,
                  height: double.infinity,
                )),
    );
  }
}
