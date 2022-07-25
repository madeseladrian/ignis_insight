import '../../domain/params/params.dart';
import '../http/http.dart';

class RemoteAuthentication {
  final String url;
  final HttpClient httpClient;

  RemoteAuthentication({required this.url, required this.httpClient});

  Future<void> auth(AuthenticationParams params) async {
    final body = {"username": params.email, "password": params.password};
    await httpClient.request(url: url, method: 'post', body: body);
  }
}