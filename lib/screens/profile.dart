import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/dropdown.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/menu.dart';
import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController fnameController = TextEditingController();
  late TextEditingController lnameController = TextEditingController();
  late TextEditingController mobileController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passController = TextEditingController();

  @override
  void initState() {
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      isScrollable: true,
      patternBackground: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopAppBar(
            color: Colors.transparent,
            onLeadingPressed: () {
              Navigator.pop(context);
            },
            leading: SvgPicture.asset(
              'lib/assets/icons/arrow.svg',
            ),
          ),
          const InlineWidget(text: 'Edit Account', isSubText: false),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SplashIcon(
                            height: ScreenSize.isSmall(context)
                                ? ScreenSize.isVerySmall(context)
                                ? MediaQuery.of(context).size.height * 0.25
                                : MediaQuery.of(context).size.height * 0.30
                                : 86.sp,
                            size: ScreenSize.isSmall(context)
                                ? 110.sp
                                : ScreenSize.isSmallHeight(context)
                                ? 115.sp
                                : ScreenSize.isTabletWidth(context)
                                ? 60.sp
                                : 100.sp,
                            icon: Image.asset('lib/assets/icons/avt-8.png'),
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.width*0.05,
                            right: MediaQuery.of(context).size.width*0.01,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white
                              ),
                              child: ClipRect(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 18,
                                  child: SplashIcon(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'lib/assets/icons/edit.svg',color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: defaultSize,),
                  TextFieldWidget(
                    width: 335.w,
                    margin: EdgeInsets.only(bottom: 0.h),
                    controller: fnameController,
                    isLabelled: true,
                    label: 'First Name',
                    hint: 'Zack',
                  ),
                  SizedBox(height: defaultSize,),
                  TextFieldWidget(
                    width: 335.w,
                    margin: EdgeInsets.only(bottom: 12.h),
                    controller: lnameController,
                    isLabelled: true,
                    label: 'Last Name',
                    hint: 'Poster',
                  ),
                  Text(
                    'Mobile No.',
                    style: TextStyle(
                        fontSize: ScreenSize.isTabletWidth(context) ? 10.sp : 14.sp,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.lightPrimaryColor),
                  ),
                  SizedBox(height: defaultSize/2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropList(
                          initialValue: '+91',
                          margin:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                          width: ScreenSize.isTabletWidth(context)?100:79,
                          image: 'lib/assets/icons/usa.svg',
                          dropList: const ['+91', '+24', '+44']),
                      SizedBox(width: defaultSize),
                      Expanded(child:  TextFieldWidget(
                        keyboard: TextInputType.number,
                        margin: EdgeInsets.only(bottom: 0.h),
                        controller: mobileController,
                        hint: '+1(229) 296-6824',
                      ),)

                    ],
                  ),
                  SizedBox(height: defaultSize,),
                  TextFieldWidget(
                    width: 330.w,
                    margin: EdgeInsets.only(bottom: 0.h),
                    controller: emailController,
                    isLabelled: true,
                    label: 'Email Address',
                    hint: 'Zack@fillerup.com',
                  ),
                  SizedBox(height: defaultSize,),
                  TextFieldWidget(
                    size: 14.sp,
                    margin: EdgeInsets.only(bottom: 16.h),
                    controller: passController,
                    isLabelled: true,
                    label: 'Password',
                    hint: '**********',
                  ),
                  ButtonWidget(
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {},
                    text: 'Update Profile',
                  ),
                  SizedBox(height: defaultSize,),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
