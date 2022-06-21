import 'package:filler_up/config/url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../config/api_string.dart';

class SignupRepo {
  Future<bool> doSignup({
    required String name,
    required String email,
    required String number,
    required String password,
    required String deviceType,
    required String fcmToken,
  }) async {

    bool isSuccess = false;

    EasyLoading.show(status: 'loading...');
    Map<String,dynamic> _body = {
      ApiStrings.name : name,
      ApiStrings.phone : number,
      ApiStrings.email : email,
      ApiStrings.password : password,
      ApiStrings.fcmToken : fcmToken,
      ApiStrings.deviceType : deviceType,
    };

    try {
      var url = Uri.parse(Urls.signupUrl);
      var response = await http.post(url, body: _body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      EasyLoading.dismiss();

      if(response.statusCode==200){
        isSuccess = true;
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
