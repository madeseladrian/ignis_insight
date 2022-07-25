import 'package:http/http.dart';

class HttpAdapter {
  final Client client;
  
  HttpAdapter({required this.client});

  Future<void> request({
    required String url
  }) async {
    await client.post(Uri.parse(url));
  }
}