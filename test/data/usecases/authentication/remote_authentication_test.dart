import 'package:ignis_insight/domain/params/params.dart';

import 'package:ignis_insight/data/usecases/usecases.dart';
import 'package:ignis_insight/data/http/http.dart';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late String url;
  late AuthenticationParams params;
  late HttpClient httpClient;
  late RemoteAuthentication sut;

  When mockRequestCall() => when(() => httpClient.request(
    url: url
  ));

  void mockRequest() => mockRequestCall().thenAnswer((_) async => _);

  setUp(() {
    params = AuthenticationParams(
      email: faker.internet.email(),
      password: faker.internet.password()
    );
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    mockRequest();
    sut = RemoteAuthentication(url: url, httpClient: httpClient);
  });

  test('1 - Should call HttpClient with correct values', () async {
    await sut.auth(params);
    verify(() => httpClient.request(
      url: url
    ));
  });
}