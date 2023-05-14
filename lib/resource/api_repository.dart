import 'package:api_bloc/resource/api_provider.dart';

import '../model/user_profile.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();
  loginApi({username, password}) {
    return _apiProvider.loginUserApi(username: username, password: password);
  }

  Future<UserProfileModal> fetchUsersList() {
    return _apiProvider.fetchUsersList();
  }
}

class NetworkError extends Error {}
