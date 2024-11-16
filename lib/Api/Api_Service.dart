// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Api_Model.dart';


class ApiService {
  final String baseUrl = 'https://theaudiodb.com/api/v1/json/2';

  Future<List<ApiModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/album.php?i=112782'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List data = jsonResponse['album'];
      return data.map((json) => ApiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}