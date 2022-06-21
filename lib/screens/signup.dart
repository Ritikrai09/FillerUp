import 'package:filler_up/config/validator.dart';
import 'package:filler_up/controller/signup_controller.dart';
import 'package:filler_up/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../colors/color_util.dart';
import '../widgets/button.dart';
import '../widgets/screen.dart';
import '../widgets/text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: ColorUtil.primaryColor),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: SvgPicture.asset(
                  'lib/assets/logo/logo.svg',
                ),
              ),

              const SizedBox(height: 30),

              TextFieldWidget(
                controller: _signupController.nameController,
                hint: 'Full name',
                size: ScreenSize.isTabletWidth(context)
                    ? 12.sp
                    : ScreenSize.isVerySmall(context)
                    ? 12.sp
                    : 16.sp,
              ),
              TextFieldWidget(
                controller: _signupController.emailController,
                hint: 'Email Address',
                keyboard: TextInputType.emailAddress,
                size: ScreenSize.isTabletWidth(context)
                    ? 12.sp
                    : ScreenSize.isVerySmall(context)
                    ? 12.sp
                    : 16.sp,
              ),
              TextFieldWidget(
                controller: _signupController.numberController,
                hint: 'Mobile Number',
                keyboard: TextInputType.number,
                size: ScreenSize.isTabletWidth(context)
                    ? 12.sp
                    : ScreenSize.isVerySmall(context)
                    ? 12.sp
                    : 16.sp,
              ),
              Obx(() => TextFieldWidget(
                  controller: _signupController.passwordController,
                  hint: 'Your password',
                  hide: _signupController.isObscure.value,
                  size: ScreenSize.isTabletWidth(context)
                      ? 12.sp
                      : ScreenSize.isVerySmall(context)
                      ? 12.sp
                      : 16.sp,
                  icon: IconButton(
                      icon: Icon(
                        _signupController.isObscure.value
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        _signupController.isObscure.value =
                        !_signupController.isObscure.value;
                      }))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => GestureDetector(
                    onTap: () {
                      _signupController.isCheck.value = ! _signupController.isCheck.value;
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.white),color: Colors.white),
                      child: Icon(Icons.check,color: _signupController.isCheck.value?Colors.red:Colors.transparent,size: 18),
                    ),
                  )),
                  const SizedBox(width: 10),
                  const Text('Agree on terms and condition',style:  TextStyle(
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white))
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ButtonWidget(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if(validate()){
                     _signupController.doSignup();
                    }
                  },
                  text: 'Sign up',
                  style: TextStyle(
                      fontSize: ScreenSize.isTabletWidth(context) ? 12.sp : 18.sp,
                      fontFamily: 'Gotham-Bold'),
                  color: ColorUtil.primaryOrangeColor,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.18),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                color: Colors.white.withOpacity(0.2),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'I\'ve already account  ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black)),
                      TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gotham',
                              fontSize: 16,
                              color: Colors.white),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.to(const Login());
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    if(_signupController.nameController.text.isEmpty){
      EasyLoading.showError('Enter full name');
      return false;
    }else if(Validator.emailValidation(_signupController.emailController.text)!=''){
      EasyLoading.showError('Enter valid email ID');
      return false;
    }else if(_signupController.numberController.text.isEmpty){
      EasyLoading.showError('Enter Mobile number');
      return false;
    }else if(_signupController.passwordController.text.isEmpty){
      EasyLoading.showError('Enter password');
      return false;
    }else if(!_signupController.isCheck.value){
      EasyLoading.showError('Agree tearms and condition');
      return false;
    }else{
      return true;
    }
  }
}
