import 'dart:convert';

import 'package:http/http.dart';
import 'package:ignis_insight/data/http/http.dart';

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
    return _handleResponse(response);
  }

  Map? _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200: return response.body.isEmpty ? null : jsonDecode(response.body);
      case 422: throw HttpError.validationError;
      default: return null;
    }
  }
}