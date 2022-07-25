import 'package:ignis_insight/domain/helpers/domain_error.dart';

import '../../domain/entities/entities.dart';
import '../../domain/params/params.dart';

import '../http/http.dart';
import '../models/models.dart';
import '../params/params.dart';

class RemoteAuthentication {
  final String url;
  final HttpClient httpClient;

  RemoteAuthentication({required this.url, required this.httpClient});

  Future<AccountEntity> auth(AuthenticationParams params) async {
    try {
      final body = RemoteAuthenticationParams.fromDomain(params).toJson();
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}