import 'package:filler_up/controller/password_controller.dart';
import 'package:filler_up/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../colors/color_util.dart';
import '../widgets/button.dart';
import '../widgets/screen.dart';
import '../widgets/text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);

  final PasswordController _passwordController = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: ColorUtil.primaryColor),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: SvgPicture.asset(
                'lib/assets/logo/logo.svg',
              ),
            ),

            const SizedBox(height: 30),
            TextFieldWidget(
              controller: _passwordController.emailController,
              hint: 'Email Address',
              keyboard: TextInputType.emailAddress,
              size: ScreenSize.isTabletWidth(context)
                  ? 12.sp
                  : ScreenSize.isVerySmall(context)
                  ? 12.sp
                  : 16.sp,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ButtonWidget(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if(_passwordController.emailController.text.isNotEmpty){}
                    Get.to(ResetPasswordScreen());

                },
                text: 'Reset Password',
                style: TextStyle(
                    fontSize: ScreenSize.isTabletWidth(context) ? 12.sp : 18.sp,
                    fontFamily: 'Gotham-Bold'),
                color: ColorUtil.primaryOrangeColor,
              ),
            ),
          ],
        ),

      ),
    );
  }
}
