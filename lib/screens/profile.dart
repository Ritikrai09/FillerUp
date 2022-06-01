import 'package:filler_up/colors/color_util.dart';
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
  void dispose() {
    super.dispose();
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
            leadingHeight: 42.h,
            leadingWidth: 42.w,
            onLeadingPressed: () {
              Navigator.pop(context);
            },
            leading: SvgPicture.asset(
              'lib/assets/icons/arrow.svg',
            ),
          ),
          const InlineWidget(text: 'Edit Account', isSubText: false),
          Wrap(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SplashIcon(
                        size: 115.sp,
                        icon: Image.asset('lib/assets/icons/avt-8.png'),
                      ),
                      Positioned(
                        bottom: 25.h,
                        right: 0.w,
                        child: CircleAvatar(
                          radius: 18.sp,
                          child: SplashIcon(
                            materialColor: ColorUtil.tabWhiteColor,
                            onPressed: () {},
                            icon: SvgPicture.asset('lib/assets/icons/edit.svg',
                                color: ColorUtil.primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              TextFieldWidget(
                height: 46.h,
                width: 335.w,
                margin: EdgeInsets.only(bottom: 0.h),
                controller: fnameController,
                isLabelled: true,
                label: 'First Name',
                hint: 'Zack',
              ),
              TextFieldWidget(
                height: 46.h,
                width: 335.w,
                margin: EdgeInsets.only(bottom: 12.h),
                controller: lnameController,
                isLabelled: true,
                label: 'Last Name',
                hint: 'Poster',
              ),
              const Text(
                'Mobile No.',
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.w500,
                    color: ColorUtil.lightPrimaryColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropList(
                      margin:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
                      width: 64.w,
                      image: 'lib/assets/icons/usa.svg',
                      dropList: const ['+91', '+24', '+44']),
                  SizedBox(width: 15.w),
                  TextFieldWidget(
                    height: 46.h,
                    width: 239.w,
                    keyboard: TextInputType.number,
                    margin: EdgeInsets.only(bottom: 0.h),
                    controller: mobileController,
                    hint: '+1(229) 296-6824',
                  ),
                ],
              ),
              TextFieldWidget(
                height: 46.h,
                width: 335.w,
                margin: EdgeInsets.only(bottom: 0.h),
                controller: emailController,
                isLabelled: true,
                label: 'Email Address',
                hint: 'Zack@fillerup.com',
              ),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
