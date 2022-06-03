import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/screens/Contact.dart';
import 'package:filler_up/screens/notification.dart';
import 'package:filler_up/screens/orders.dart';
import 'package:filler_up/screens/profile.dart';
import 'package:filler_up/screens/query.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/list_widget.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> details = [
    'Message',
    'Settings',
    'Terms of Service',
    'Logout'
  ];
  final List<String> icons = [
    'message.svg',
    'settings.svg',
    'terms.svg',
    'logout.svg'
  ];

  final List<Widget> screens = [
    const NotificationScreen(),
    const NotificationScreen(),
    const Query(),
    const NotificationScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return MainBoxWidget(
      patternBackground: true,
      child: Column(
        children: [
          TopAppBar(
            isImage: true,
            onLeadingPressed: () {
              Navigator.pop(context);
            },
            leading: SvgPicture.asset(
              'lib/assets/icons/arrow.svg',
            ),
            leadingHeight: ScreenSize.isVerySmallWidth(context) ? 60.h : 42.w,
            leadingWidth: ScreenSize.isVerySmallWidth(context) ? 60.w : 42.w,
            color: Colors.transparent,
            image: SvgPicture.asset(
              'lib/assets/icons/edit.svg',
            ),
            onImagePressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const Profile()));
            },
            imgColor: ColorUtil.primaryOrangeColor,
          ),
          InlineWidget(
              text: 'Hi Zack Foster',
              textStyle: TextStyle(
                  fontSize: ScreenSize.isSmall(context)
                      ? ScreenSize.isSmall(context)
                          ? 20.sp
                          : 21.sp
                      : ScreenSize.isTabletWidth(context)
                          ? 15.sp
                          : 22.sp,
                  height: ScreenSize.isVerySmall(context) ? 1.4.h : 1.h,
                  fontFamily: 'Gotham-Bold',
                  color: Colors.white),
              isSubText: false),
          SizedBox(
            height: ScreenSize.isSmall(context)
                ? 5.h
                : ScreenSize.isTabletWidth(context)
                    ? 0.h
                    : 15.h,
          ),
          Row(
            children: [
              SplashIcon(
                height: ScreenSize.isSmall(context)
                    ? MediaQuery.of(context).size.height * 0.16
                    : 76.sp,
                size: ScreenSize.isSmall(context)
                    ? 90.sp
                    : ScreenSize.isTabletWidth(context)
                        ? 60.sp
                        : 100.sp,
                icon: Image.asset('lib/assets/icons/avt-8.png'),
              ),
            ],
          ),
          SizedBox(
            height: ScreenSize.isSmall(context)
                ? 5.h
                : ScreenSize.isTabletWidth(context)
                    ? 0.h
                    : 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoxWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Contact()));
                  },
                  text: 'Help',
                  image: 'help'),
              BoxWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Order()));
                  },
                  text: 'wallet',
                  image: 'wallet'),
              BoxWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Order()));
                  },
                  text: 'Trips',
                  image: 'trips')
            ],
          ),
          SizedBox(
            height: ScreenSize.isVerySmall(context)
                ? screenSize.height * 0.32
                : ScreenSize.isSmall(context)
                    ? screenSize.height * 0.31
                    : MediaQuery.of(context).size.height * 0.34,
            child: ListView.builder(
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return ListWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => screens[index]));
                    },
                    iconWidth: ScreenSize.isVerySmallWidth(context)
                        ? screenSize.width * 0.105
                        : screenSize.height * 0.169,
                    height: ScreenSize.isSmall(context)
                        ? ScreenSize.isTabletHeight(context)
                            ? screenSize.height * 0.115
                            : ScreenSize.isVerySmall(context)
                                ? screenSize.height * 0.085
                                : screenSize.height * 0.069
                        : ScreenSize.isTabletWidth(context)
                            ? screenSize.height * 0.085
                            : ScreenSize.isTabletHeight(context)
                                ? screenSize.height * 0.080
                                : screenSize.height * 0.065,
                    icon: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child:
                          SvgPicture.asset('lib/assets/icons/${icons[index]}'),
                    ),
                    text: details[index],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget BoxWidget({required VoidCallback onTap, String? text, String? image}) {
    var screenSize = MediaQuery.of(context).size;
    return Transform.scale(
      scale: ScreenSize.isSmall(context)
          ? ScreenSize.isVerySmall(context)
              ? 0.73
              : 0.8
          : ScreenSize.isTabletWidth(context)
              ? 0.9
              : 1.0,
      child: Container(
        width: ScreenSize.isTabletWidth(context) ? 75.w : 100.w,
        height: ScreenSize.isSmall(context)
            ? ScreenSize.isVerySmall(context)
                ? screenSize.height * 0.165
                : screenSize.height * 0.142
            : ScreenSize.isTabletWidth(context)
                ? screenSize.height * 0.143
                : screenSize.height * 0.123,
        padding: EdgeInsets.only(top: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            child: IconButton(
              splashRadius: 45.r,
              icon: Column(
                mainAxisAlignment: ScreenSize.isSmall(context)
                    ? MainAxisAlignment.spaceBetween
                    : ScreenSize.isTabletWidth(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceAround,
                children: [
                  Transform.scale(
                    scale: ScreenSize.isSmall(context)
                        ? ScreenSize.isVerySmall(context)
                            ? 0.65.sp
                            : 0.75.sp
                        : ScreenSize.isTabletWidth(context)
                            ? 0.6.sp
                            : ScreenSize.isTabletHeight(context)
                                ? 0.7.sp
                                : 1.sp,
                    child: SvgPicture.asset(
                      'lib/assets/icons/$image.svg',
                    ),
                  ),
                  Text(text ?? '',
                      style: TextStyle(
                          fontSize: ScreenSize.isSmall(context)
                              ? 12.5.sp
                              : ScreenSize.isTabletWidth(context)
                                  ? 12.sp
                                  : ScreenSize.isTabletHeight(context)
                                      ? 14.5
                                      : 13.sp,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.w600,
                          height: ScreenSize.isTabletWidth(context)
                              ? 2.5.h
                              : 1.56.h,
                          color: Colors.black87)),
                ],
              ),
              onPressed: onTap,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: ColorUtil.tabWhiteColor,
            borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}
