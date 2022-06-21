import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NetworkHelper {
  static Future<bool> isInternetIsOn({bool showToast = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static showNoInternetToast() {
    EasyLoading.showError('No Internet');
  }
}