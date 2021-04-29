import 'dart:convert';

import 'package:http/http.dart' as http;

class RestClient {
  Future<dynamic> get(String path) async {
    final response = await http.get(Uri.parse(path));
    final responseBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400) {
      throw Exception(); //todo: NetworkException
    }
    return jsonDecode(responseBody);
  }
}
