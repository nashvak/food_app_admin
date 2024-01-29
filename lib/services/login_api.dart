import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:food_app_admin/constants/api.dart';
import 'package:food_app_admin/models/user_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginApiService {
  Future<Usermodel> login(String email, String password) async {
    // final dio = Dio();

    final Map<String, dynamic> data = {"username": email, "password": password};

    try {
      final response = await http.post(
        Uri.parse('{$baseUrl/$authUrl}'),
        body: data,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print(response.body);
        final Usermodel user = Usermodel.fromJson(result);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', user.token.toString());
        return user;
      } else {
        print("${response.statusCode}");
        return Usermodel(email: '', pa);
      }
    } catch (e) {}
  }
}
