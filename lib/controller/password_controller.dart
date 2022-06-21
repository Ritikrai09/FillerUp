import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final RxBool isObscurePassword = true.obs;
  final RxBool isObscureConfirmPassword = true.obs;

}