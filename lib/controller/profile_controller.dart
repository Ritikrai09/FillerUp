import 'package:filler_up/repositories/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String countryCode= '';

  final ProfileRepo _profileRepo = ProfileRepo();
  final ImagePicker picker = ImagePicker();
  XFile image = XFile('');


  void updateProfile(String imagePath) {

    _profileRepo.updateProfile(
      email: emailController.text,
      name: nameController.text,
      imagePath: imagePath
    );

  }
}