import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/main.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/divider.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/social.dart';
import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/common_size.dart';
import '../widgets/screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController nameController, passController;
  bool _isObscure = false;
  late FocusNode focus1, focus2;

  @override
  void initState() {
    nameController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 65.h),
        child: Column(
          children: [
            const InlineWidget(
              text: 'Welcome,',
              color: Colors.white,
              subText: 'Please Login to your account',
              spaceBetweenText: 0,
            ),
            SizedBox(height: defaultSize),
            TextFieldWidget(
              controller: nameController,
              hint: 'Email Address',
              size: ScreenSize.isTabletWidth(context)
                  ? 12.sp
                  : ScreenSize.isVerySmall(context)
                      ? 12.sp
                      : 16.sp,
            ),
            TextFieldWidget(
                controller: passController,
                hint: 'Enter your password',
                hide: _isObscure,
                size: ScreenSize.isTabletWidth(context)
                    ? 12.sp
                    : ScreenSize.isVerySmall(context)
                        ? 12.sp
                        : 16.sp,
                icon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.remove_red_eye : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    })),
            ButtonWidget(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const MyHomePage(
                              title: 'Filler Up',
                            )));
              },
              text: 'Login',
              style: TextStyle(
                  fontSize: ScreenSize.isTabletWidth(context) ? 12.sp : 18.sp,
                  fontFamily: 'Gotham-Bold'),
              color: ColorUtil.primaryOrangeColor,
            ),
            SizedBox(height: 24.h),
            const DividerWidget(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const SocialWidget(
                      image: 'lib/assets/social/fb.svg',
                      color: Colors.blue,
                      isColored: true),
                  SizedBox(width: defaultSize*3,),
                  const SocialWidget(image: 'lib/assets/social/Google1.svg')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
