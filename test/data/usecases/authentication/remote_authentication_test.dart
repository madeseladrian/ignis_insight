import 'package:ignis_insight/data/http/http.dart';
import 'package:ignis_insight/domain/helpers/helpers.dart';
import 'package:ignis_insight/domain/params/params.dart';
import 'package:ignis_insight/data/usecases/usecases.dart';

import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late String url;
  late AuthenticationParams params;
  late Map apiResult;
  late HttpClientSpy httpClient;
  late RemoteAuthentication sut;

  setUp(() {
    url = faker.internet.httpUrl();
    params = AuthenticationParams(
      email: faker.internet.email(),
      password: faker.internet.password()
    );
    apiResult = {"access_token": faker.guid.guid()};
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteAuthentication(url: url, httpClient: httpClient);
  });

  test('1,2,3 - Should call HttpClient with correct values', () async {
    await sut.auth(params);
    verify(() => httpClient.request(
      url: url,
      method: 'post',
      body: {"username": params.email, "password": params.password}
    ));
  });

  test('4 - Should return an AccountEntity if HttpClient returns 200', () async {
    final accountEntity = await sut.auth(params);
    expect(accountEntity.token, apiResult['access_token']);
  });

  test('5 - Should throw ValidationError if HttpClient returns 422', () async {
    httpClient.mockError(HttpError.validationError);
    final future = sut.auth(params);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('6 - Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClient.mockError(HttpError.serverError);
    final future = sut.auth(params);
    expect(future, throwsA(DomainError.unexpected));
  });
}