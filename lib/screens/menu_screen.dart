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
  @override
  Widget build(BuildContext context) {
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
          const InlineWidget(text: 'Hi Zack Foster', isSubText: false),
          Row(
            children: [
              SplashIcon(
                size: 115.sp,
                icon: Image.asset('lib/assets/icons/avt-8.png'),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
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
          ListWidget(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const NotificationScreen()));
            },
            icon: const Icon(Icons.mail, color: Colors.white),
            text: "Message",
            textStyle: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          const ListWidget(
            icon: Icon(Icons.settings, color: Colors.white),
            text: "Settings",
          ),
          ListWidget(
            icon: Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: SvgPicture.asset('lib/assets/icons/terms.svg')),
            text: "Terms of Service",
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const Query()));
            },
          ),
          ListWidget(
            icon: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: SvgPicture.asset('lib/assets/icons/logout.svg'),
            ),
            text: "Logout",
          ),
        ],
      ),
    );
  }

  Widget BoxWidget({required VoidCallback onTap, String? text, String? image}) {
    return Container(
      width: 100.w,
      height: 70.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: IconButton(
            splashRadius: 45.sp,
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('lib/assets/icons/$image.svg'),
                Text(text ?? '',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w600,
                        height: 1.56.h,
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
    );
  }
}
