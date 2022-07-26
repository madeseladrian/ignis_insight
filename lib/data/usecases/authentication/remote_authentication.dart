import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/params/params.dart';
import '../../../domain/usecases/usecases.dart';

import '../../http/http.dart';
import '../../models/models.dart';
import '../../params/params.dart';

class RemoteAuthentication implements Authentication {
  final String url;
  final HttpClient httpClient;

  RemoteAuthentication({required this.url, required this.httpClient});

  @override
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