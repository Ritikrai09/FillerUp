import 'package:filler_up/repositories/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class LoginController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RxBool isObscure = true.obs;

  final LoginRepo _loginRepo = LoginRepo();

  Future<void> doLogin() async {
    bool isSuccess = await _loginRepo.doLogin(
        number: numberController.text,
        password: passwordController.text,
        deviceType: GetPlatform.isAndroid ? 'android' : 'ios',
        fcmToken: '');

    if(isSuccess){
      Get.offAll( const MyHomePage());
    }
  }
}
