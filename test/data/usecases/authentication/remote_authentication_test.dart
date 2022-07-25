import 'package:ignis_insight/domain/params/params.dart';
import 'package:ignis_insight/data/usecases/usecases.dart';

import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late String url;
  late AuthenticationParams params;
  late HttpClientSpy httpClient;
  late RemoteAuthentication sut;

  setUp(() {
    url = faker.internet.httpUrl();
    params = AuthenticationParams(
      email: faker.internet.email(),
      password: faker.internet.password()
    );
    httpClient = HttpClientSpy();
    httpClient.mockRequest();
    sut = RemoteAuthentication(url: url, httpClient: httpClient);
  });

  test('1 - Should call HttpClient with correct values', () async {
    await sut.auth(params);
    verify(() => httpClient.request(
      url: url
    ));
  });
}