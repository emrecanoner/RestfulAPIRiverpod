import 'dart:convert';
import 'dart:developer';

import 'package:restfull_api_riverpod/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:restfull_api_riverpod/models/model_login.dart';

class Service {
  final String url2 = 'https://nottapp.herokuapp.com/login';
  final dio = Dio();

  static Future<UserModel?> fetch() async {
    var url = Uri.parse('https://reqres.in/api/users?page=2');
    var response2;
    try {
      response2 = await http.get(url);
      if (response2.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response2.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<LoginModel?> loginCall({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> json = {"email": email, "password": password};
    var response = await dio.post(url2, data: json);
    if (response.statusCode == 200) {
      var result = LoginModel.fromJson(response.data);
      log('Gelen Response => ${response.data}');
      return result;
    } else {
      throw ('Bir Sorun Oluştu ${response.statusCode}');
    }
  }
}
