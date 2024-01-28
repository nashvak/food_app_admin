import 'package:dio/dio.dart';
import 'package:food_app_admin/constants/api.dart';
import 'package:food_app_admin/models/user_login_model.dart';

class LoginApiService {
  Future<UserModel> login(String email, String password) async {
    final dio = Dio();
    final data = {"email": email, "password": password};
    Response response = await dio.post(API_KEY, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(
        email: email,
      );
    } else {
      return null;
    }
  }
}
