// services/register_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_api/api_register/register_model.dart';

class RegisterService {
  final String baseUrl = 'https://mediadwi.com';

  Future<RegisterResponseModel> register(
      String username, String password, String fullName, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/latihan/register-user'),
      body: {
        'username': username,
        'password': password,
        'full_name': fullName,
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return RegisterResponseModel.fromJson(responseData);
    } else {
      throw ('Failed to register user');
    }
  }
}