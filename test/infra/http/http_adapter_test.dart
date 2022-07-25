import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:ignis_insight/infra/http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  late String url;
  late ClientSpy client;
  late HttpAdapter sut;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client: client);
  });

  setUpAll(() {
    url = faker.internet.httpUrl();
    registerFallbackValue(Uri.parse(url));
  });

  group('post', () {
    test('1,2,3,4 - Should call post with correct values', () async {
      sut.request(url: url, body: {"any_key":"any_value"});
      verify(() => client.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"any_key":"any_value"}
      ));
    });
  });  
}