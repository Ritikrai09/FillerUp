import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/menu_screen.dart';

class TopAppBar extends StatelessWidget {
  final IconData? trailing;
  final Widget? leading;
  final Widget? image;
  final bool isImage;
  final double? leadingWidth, leadingHeight;
  final EdgeInsetsGeometry? padding;
  final Color? color, imgColor;
  final VoidCallback? onImagePressed, onLeadingPressed;
  const TopAppBar(
      {Key? key,
      this.leading,
      this.color,
      this.trailing,
      this.padding,
      this.leadingWidth,
      this.leadingHeight,
      this.image,
      this.onImagePressed,
      this.onLeadingPressed,
      this.imgColor,
      this.isImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: leadingWidth ?? 54.w,
                height: leadingHeight ?? 54.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color ?? Colors.transparent),
                child: SplashIcon(
                    onPressed: onLeadingPressed ?? () {},
                    icon:
                        leading ?? Image.asset('lib/assets/icons/avt-8.png'))),
            isImage
                ? SplashIcon(
                    onPressed: onImagePressed ??
                        () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const MenuScreen()));
                        },
                    icon: image,
                    materialColor: imgColor)
                : leading == null
                    ? SplashIcon(
                        icon: SvgPicture.asset(
                          'lib/assets/icons/arrow.svg',
                          color: ColorUtil.lightWhiteColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                    : const SizedBox()
          ],
        ),
        SizedBox(height: 20.h)
      ],
    );
  }
}
