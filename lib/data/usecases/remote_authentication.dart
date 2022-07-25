import '../../domain/entities/entities.dart';
import '../../domain/params/params.dart';

import '../http/http.dart';
import '../models/models.dart';

class RemoteAuthentication {
  final String url;
  final HttpClient httpClient;

  RemoteAuthentication({required this.url, required this.httpClient});

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = {"username": params.email, "password": params.password};
    final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
    return RemoteAccountModel.fromJson(httpResponse).toEntity();
  }
}