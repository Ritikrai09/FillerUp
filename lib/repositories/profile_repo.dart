import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../config/api_string.dart';
import '../config/url.dart';
import '../config/user_info.dart';
import '../model/user_data_model.dart';

class ProfileRepo {
  UserData userData = UserData();
  final box = GetStorage();

  updateProfile(
      {required String name,
      required String email,
      required String imagePath}) async {
    bool isSuccess = false;

    EasyLoading.show(status: 'loading...');
    Map<String, dynamic> _body = {
      ApiStrings.id: UserInformation.userData.value.data!.id,
      ApiStrings.name: name,
      ApiStrings.email: email,
    };

    try {
      if (imagePath != '') {
        var url = Uri.parse(Urls.imageUpload);

        var requestBody = FormData.fromMap({
          'file': await MultipartFile.fromFile(imagePath,
              filename: imagePath,
              contentType: MediaType("image", imagePath.split('.').last)),
          'id': UserInformation.userData.value.data!.id
        });

        await Dio().post(url.toString(), data: requestBody);
      }

      var url = Uri.parse(Urls.updateProfileUrl);
      var response = await http.post(url, body: _body);
      print('Response status: ${response.statusCode}');

      Map<String, dynamic> data = jsonDecode(response.body);

      EasyLoading.dismiss();

      userData = UserData.fromJson(data);

      if (response.statusCode == 200) {
        if (userData.success ?? false) {
          box.write(ApiStrings.userData, userData);
          box.write(ApiStrings.isLogin, true);

          UserInformation.userData.value = userData;

          EasyLoading.showSuccess('profile updated!');

          isSuccess = true;
        } else {
          EasyLoading.showError(userData.message ?? 'Something went wrong.');
        }
      } else {
        EasyLoading.showError(
            'Something went wrong.\nPlease try after Sometimes');
      }
    } on Exception catch (e) {
      print(e);
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }

    return isSuccess;
  }
}
