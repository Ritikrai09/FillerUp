import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/controller/login_controller.dart';
import 'package:filler_up/screens/forgot_password_screen.dart';
import 'package:filler_up/screens/signup.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 65.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const InlineWidget(
                text: 'Welcome,',
                color: Colors.white,
                subText: 'Please Login to your account',
              ),
              SizedBox(height: 45.h),
              TextFieldWidget(

                controller: _loginController.numberController,
                hint: 'Enter phone number',
                keyboard: TextInputType.number,

                size: ScreenSize.isTabletWidth(context)
                    ? 12.sp
                    : ScreenSize.isVerySmall(context)
                        ? 12.sp
                        : 16.sp,
              ),
              Obx(() => TextFieldWidget(
                  controller: _loginController.passwordController,
                  hint: 'Enter your password',
                  hide: _loginController.isObscure.value,
                  size: ScreenSize.isTabletWidth(context)
                      ? 12.sp
                      : ScreenSize.isVerySmall(context)
                          ? 12.sp
                          : 16.sp,
                  icon: IconButton(
                      icon: Icon(
                        _loginController.isObscure.value
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        _loginController.isObscure.value =
                            !_loginController.isObscure.value;
                      }))),
              ButtonWidget(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                    _loginController.doLogin();

                },
                text: 'Login',
                style: TextStyle(
                    fontSize: ScreenSize.isTabletWidth(context) ? 12.sp : 18.sp,
                    fontFamily: 'Gotham-Bold'),
                color: ColorUtil.primaryOrangeColor,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Get.to(ForgotPasswordScreen());
                },
                child: Text('Forgot Password?',
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        height: ScreenSize.isSmall(context)
                            ? ScreenSize.isSmall(context)
                                ? 2.6.h
                                : 2.h
                            : 1.8.h,
                        fontSize: ScreenSize.isSmall(context)
                            ? ScreenSize.isVerySmall(context)
                                ? 12.sp
                                : 14.5.sp
                            : ScreenSize.isSmallWidth(context)
                                ? 12.sp
                                : ScreenSize.isTabletWidth(context)
                                    ? 13.sp
                                    : 15.5.sp,
                        color: Colors.white)),
              ),
               SizedBox(height: MediaQuery.of(context).size.height*0.3),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                color: Colors.white.withOpacity(0.2),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Not having an account?  ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black)),
                      TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gotham',
                              fontSize: 16,
                              color: Colors.white),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.to(SignupScreen());
                          }),
                    ],
                  ),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
