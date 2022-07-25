import 'dart:convert';

import 'package:http/http.dart';

class HttpAdapter {
  final Client client;
  
  HttpAdapter({required this.client});

  Future<Map?> request({
    required String url,
    required String method,
    Map? body
  }) async {
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final encoding = Encoding.getByName('utf-8');
    final response = await client.post(
      Uri.parse(url), 
      headers: headers,
      encoding: encoding,
      body: body
    );
    return jsonDecode(response.body);
  }
}