import 'package:http/http.dart';

class HttpAdapter {
  final Client client;
  
  HttpAdapter({required this.client});

  Future<void> request({
    required String url
  }) async {
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    await client.post(Uri.parse(url), headers: headers);
  }
}