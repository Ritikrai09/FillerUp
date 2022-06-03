import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/menu_screen.dart';
import 'screen.dart';

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
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: ScreenSize.isSmall(context)
                    ? screenSize.width * 0.14
                    : screenSize.width * 0.18,
                height: ScreenSize.isSmall(context)
                    ? screenSize.height * 0.17
                    : MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color ?? Colors.transparent),
                child: SplashIcon(
                    onPressed: onLeadingPressed ?? () {},
                    height: ScreenSize.isSmall(context)
                        ? ScreenSize.isVerySmall(context)
                            ? screenSize.height * 0.160
                            : screenSize.height * 0.135
                        : ScreenSize.isTabletWidth(context)
                            ? screenSize.height * 0.055
                            : screenSize.height * 0.10,
                    icon:
                        leading ?? Image.asset('lib/assets/icons/avt-8.png'))),
            isImage
                ? SplashIcon(
                    height: ScreenSize.isSmall(context)
                        ? ScreenSize.isVerySmall(context)
                            ? screenSize.height * 0.105
                            : screenSize.height * 0.095
                        : ScreenSize.isTabletWidth(context)
                            ? screenSize.height * 0.085
                            : screenSize.height * 0.15,
                    onPressed: onImagePressed ??
                        () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const MenuScreen()));
                        },
                    icon: image,
                    color: imgColor,
                    materialColor: imgColor)
                : leading == null
                    ? SplashIcon(
                        height: ScreenSize.isSmall(context)
                            ? ScreenSize.isVerySmall(context)
                                ? screenSize.height * 0.110
                                : screenSize.height * 0.095
                            : ScreenSize.isTabletWidth(context)
                                ? screenSize.height * 0.055
                                : screenSize.height * 0.10,
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
        SizedBox(
            height: ScreenSize.isSmall(context)
                ? ScreenSize.isVerySmall(context)
                    ? 0.h
                    : 10.h
                : 0.h)
      ],
    );
  }
}
