import 'package:filler_up/config/network_helper.dart';
import 'package:filler_up/repositories/signup_repo.dart';
import 'package:filler_up/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final RxBool isObscure = true.obs;
  final RxBool isCheck = false.obs;

  final SignupRepo _signupRepo = SignupRepo();

  Future<void> doSignup() async {
    if (await NetworkHelper.isInternetIsOn()) {
     bool isSuccessSignUp = await  _signupRepo.doSignup(
          name: nameController.text,
          email: emailController.text,
          number: numberController.text,
          password: passwordController.text,
          deviceType: GetPlatform.isAndroid ? 'android' : 'ios',
          fcmToken: '');

     if(isSuccessSignUp){
       Get.to(const Home());
     }
    } else {
      NetworkHelper.showNoInternetToast();
    }
  }
}
