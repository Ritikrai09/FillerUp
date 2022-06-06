import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,),
            child: SplashIcon(
                onPressed: onLeadingPressed ?? () {},
                size: 50,
                icon:
                    leading ?? Image.asset('lib/assets/icons/avt-8.png',fit: BoxFit.fill))),
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
                    icon: SvgPicture.asset(
                      'lib/assets/icons/arrow.svg',
                      color: ColorUtil.lightWhiteColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
                : const SizedBox()
      ],
    );
  }
}
