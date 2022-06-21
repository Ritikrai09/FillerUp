import 'dart:convert';

import 'package:filler_up/config/api_string.dart';
import 'package:filler_up/model/user_data_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

import '../config/url.dart';
import 'package:http/http.dart' as http;

import '../config/user_info.dart';

class LoginRepo {

  UserData userData = UserData();
  final box = GetStorage();

  Future<bool> doLogin(
      {required String number,
      required String password,
      required String deviceType,
      required String fcmToken}) async {

    bool isSuccess = false;

    EasyLoading.show(status: 'loading...');
    Map<String, dynamic> _body = {
      ApiStrings.phone : number,
      ApiStrings.password : password,
      ApiStrings.fcmToken : fcmToken,
      ApiStrings.deviceType : deviceType,
    };

    try {
      var url = Uri.parse(Urls.loginUrl);
      var response = await http.post(url, body: _body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map<String,dynamic> data = jsonDecode(response.body);

      EasyLoading.dismiss();

      userData = UserData.fromJson(data);

      if(response.statusCode==200){
        if (userData.success??false) {

          box.write(ApiStrings.userData, userData);
          box.write(ApiStrings.isLogin, true);

          UserInformation.userData.value = userData;

          print('---${box.read(ApiStrings.isLogin)}-------');

          isSuccess = true;

        } else {
          EasyLoading.showError(
              userData.message??'Something went wrong.');
        }
      }else{
        EasyLoading.showError('Something went wrong.\nPlease try after Sometimes');
      }

    } on Exception catch (e) {
      print(e);
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }

    return isSuccess;
  }
}
