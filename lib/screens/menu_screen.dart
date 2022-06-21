import 'package:cached_network_image/cached_network_image.dart';
import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/screens/contact.dart';
import 'package:filler_up/screens/login.dart';
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
import 'package:get_storage/get_storage.dart';
import '../config/api_string.dart';
import '../config/user_info.dart';
import '../widgets/menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final box = GetStorage();

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
          ValueListenableBuilder(valueListenable:UserInformation.userData, builder: (context, value, child){
            return InlineWidget(
                text: 'Hi ${UserInformation.userData.value.data?.name}',
                textStyle: TextStyle(
                    fontSize: ScreenSize.isSmall(context)
                        ? ScreenSize.isSmall(context)
                        ? 20.sp
                        : 21.sp
                        : ScreenSize.isTabletWidth(context)
                        ? 15.sp
                        : 22.sp,
                    fontFamily: 'Gotham-Bold',
                    color: Colors.white),
                isSubText: false);
          }),
          SizedBox(
            height: ScreenSize.isSmall(context)
                ? 5.h
                : ScreenSize.isTabletWidth(context)
                    ? 0.h
                    : 15.h,
          ),
          Row(
            children: [
              ValueListenableBuilder(valueListenable:UserInformation.userData, builder: (context, value, child){
                return SplashIcon(
                  height: ScreenSize.isSmall(context)
                      ? MediaQuery.of(context).size.height * 0.16
                      : 76.sp,
                  size: ScreenSize.isSmall(context)
                      ? 90.sp
                      : ScreenSize.isTabletWidth(context)
                      ? 60.sp
                      : 100.sp,
                  icon:  CachedNetworkImage(
                    imageUrl: '${ApiStrings.prefixImageUrl}${UserInformation.userData.value.data!.image!}',
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.asset(
                        'lib/assets/icons/avt-8.png',
                        fit: BoxFit.fill),
                  ),
                );
              }),
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
              boxWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Contact()));
                  },
                  text: 'Help',
                  image: 'help'),
              boxWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Order()));
                  },
                  text: 'wallet',
                  image: 'wallet'),
              boxWidget(
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
          SizedBox(height: defaultSize,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return ListWidget(
                    onTap: () {

                      if(index!=3){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => screens[index]));
                      }else{
                        box.remove(ApiStrings.userData);
                        box.remove(ApiStrings.isLogin);
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(
                            builder: (context) => const Login()), (route) => false);
                      }

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
                          SvgPicture.asset('lib/assets/icons/${icons[index]}',height: 20,width: 20),
                    ),
                    text: details[index],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget boxWidget({required VoidCallback onTap, String? text, String? image}) {
    return Expanded(
      child: Container(
        height: 90,
        padding: EdgeInsets.only(top: 5.h),
        margin: const EdgeInsets.only(left: 7, right: 7),
        child: IconButton(
          splashRadius: 45.r,
          icon: Column(
            mainAxisAlignment: ScreenSize.isSmall(context)
                ? MainAxisAlignment.spaceBetween
                : ScreenSize.isTabletWidth(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'lib/assets/icons/$image.svg',
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
                      color: Colors.black87)),
            ],
          ),
          onPressed: onTap,
        ),
        decoration: BoxDecoration(
            color: ColorUtil.tabWhiteColor,
            borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}
