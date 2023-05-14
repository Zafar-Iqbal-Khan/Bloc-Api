import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_profile.dart';

class ApiProvider {
  Dio dio = Dio();

  loginUserApi({username, password}) async {
    try {
      Response response =
          await dio.get("https://mhirail.com/api/auth_token.php");
      return response.data["token"];
    } catch (e) {}
  }

  Future<UserProfileModal> fetchUsersList() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      var options = Options(headers: {
        'Content-Type': 'application/json',
        'Auth-Token': '${sharedPref.getString("TOKEN")}',
      });
      Response response2 = await dio.get("https://mhirail.com/api/profile.php",
          options: options);
      print(response2.data);
      var value = response2.data;
      return UserProfileModal.fromJson(value);
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return UserProfileModal.withError(
            "Check your internet connection please");
      }
      return UserProfileModal.withError(e.toString());
    }
  }
}
