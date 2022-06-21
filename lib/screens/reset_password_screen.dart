import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../colors/color_util.dart';
import '../controller/password_controller.dart';
import '../widgets/button.dart';
import '../widgets/screen.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);

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
              controller: _passwordController.codeController,
              hint: 'Enter your security code',
              keyboard: TextInputType.number,
              size: ScreenSize.isTabletWidth(context)
                  ? 12.sp
                  : ScreenSize.isVerySmall(context)
                  ? 12.sp
                  : 16.sp,
            ),
            Obx(() => TextFieldWidget(
                controller: _passwordController.passwordController,
                hint: 'Enter your new password',
                hide: _passwordController.isObscurePassword.value,
                size: ScreenSize.isTabletWidth(context)
                    ? 12.sp
                    : ScreenSize.isVerySmall(context)
                    ? 12.sp
                    : 16.sp,
                icon: IconButton(
                    icon: Icon(
                      _passwordController.isObscurePassword.value
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      _passwordController.isObscurePassword.value =
                      !_passwordController.isObscurePassword.value;
                    }))),
            Obx(() => TextFieldWidget(
                controller: _passwordController.confirmPasswordController,
                hint: 'Enter your confirm password',
                hide: _passwordController.isObscureConfirmPassword.value,
                size: ScreenSize.isTabletWidth(context)
                    ? 12.sp
                    : ScreenSize.isVerySmall(context)
                    ? 12.sp
                    : 16.sp,
                icon: IconButton(
                    icon: Icon(
                      _passwordController.isObscureConfirmPassword.value
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      _passwordController.isObscureConfirmPassword.value =
                      !_passwordController.isObscureConfirmPassword.value;
                    }))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ButtonWidget(
                onPressed: () {


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
