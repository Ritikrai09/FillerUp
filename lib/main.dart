import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/screens/boat.dart';
import 'package:filler_up/screens/equipment.dart';
import 'package:filler_up/screens/heating.dart';
import 'package:filler_up/screens/login.dart';

import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => GetMaterialApp(
              title: 'Filler Up',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Gowtham',
                primarySwatch: Colors.blue,
              ),
              home: const SplashScreen(),
              builder: EasyLoading.init(),
            ));
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => const Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(32.sp),
        child: Center(
          child: SvgPicture.asset(
            'lib/assets/logo/logo.svg',
          ),
        ),
        decoration: const BoxDecoration(color: ColorUtil.primaryColor));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> myProducts = ['EQUIPMENT', 'BOAT', 'Home'];
  final List<String> images = ['equip', 'boat', 'home'];
  final List<dynamic> positions = [
    [25.0, 0.0],
    [0.0, 35.0],
    [0.0, 25.0]
  ];

  int isSelected = -1;

  @override
  void initState() {
    super.initState();
  }

  Future<void> routeTo(int index) async {
    switch (index) {
      case 0:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const Equipment()));
        break;
      case 1:
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => const Boat()));
        break;
      case 2:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const HeatingOil()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TopAppBar(
              isImage: true,
              image: SvgPicture.asset('lib/assets/icons/menu.svg')),
          const InlineWidget(),
          gridWidget
        ]));
  }

  Widget get gridWidget {
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150.w,
              mainAxisExtent: ScreenSize.isSmall(context) ? 210.h : 200.h,
              childAspectRatio: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 30.h),
          shrinkWrap: true,
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            var screenSize = MediaQuery.of(context).size;
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = index;
                });
                routeTo(index);
              },
              child: Container(
                height: ScreenSize.isSmall(context)
                    ? ScreenSize.isVerySmall(context)
                        ? screenSize.height * 0.197
                        : screenSize.height * 0.167
                    : screenSize.height * 0.207,
                alignment: Alignment.center,
                margin: EdgeInsets.all(4.sp),
                padding: ScreenSize.isVerySmall(context)
                    ? EdgeInsets.only(bottom: 10.h)
                    : EdgeInsets.all(0.sp),
                child: Column(
                  mainAxisAlignment: ScreenSize.isVerySmall(context)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Transform.scale(
                          scale: ScreenSize.isSmall(context)
                              ? ScreenSize.isVerySmall(context)
                                  ? 0.6.sp
                                  : 0.8.sp
                              : ScreenSize.isSmallWidth(context)
                                  ? 0.75.sp
                                  : ScreenSize.isTabletWidth(context)
                                      ? 0.69.sp
                                      : 1.0.sp,
                          child: SvgPicture.asset(
                            'lib/assets/icons/${images[index]}.svg',
                          ),
                        ),
                        Positioned(
                          left: positions[index][1],
                          top: positions[index][0],
                          child: CircleAvatar(
                            radius: ScreenSize.isVerySmall(context)
                                ? 13.5.r
                                : 11.5.r,
                            backgroundColor: ColorUtil.orangeTransparent,
                          ),
                        )
                      ],
                    ),
                    Text(myProducts[index],
                        style: TextStyle(
                            fontSize: ScreenSize.isSmall(context)
                                ? 14.sp
                                : ScreenSize.isTabletWidth(context)
                                    ? ScreenSize.isSmallWidth(context)
                                        ? 11.sp
                                        : 12.sp
                                    : 16.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w700,
                            color: ColorUtil.primaryColor)),
                  ],
                ),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: ColorUtil.lightPrimaryColor,
                          offset: Offset(2.5, 2.25),
                          spreadRadius: 0.75,
                          blurRadius: 0)
                    ],
                    color: isSelected == index
                        ? ColorUtil.tabHighlightColor
                        : ColorUtil.tabWhiteColor,
                    borderRadius: BorderRadius.circular(16.r)),
              ),
            );
          }),
    );
  }
}
