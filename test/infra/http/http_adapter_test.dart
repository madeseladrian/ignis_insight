import 'package:ignis_insight/data/http/http.dart';
import '../mocks/mocks.dart';

import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:ignis_insight/infra/http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

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
      sut.request(url: url, method: 'post', body: {"any_key":"any_value"});
      verify(() => client.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"any_key":"any_value"}
      ));
    });

    test('5 - Should return data if post returns 200', () async { 
      final response = await sut.request(url: url, method: 'post');
      expect(response, {"any_key":"any_value"});
    });

    test('6 - Should return data if post returns 200 without data', () async { 
      client.mockPost(200, body: '');
      final response = await sut.request(url: url, method: 'post');
      expect(response, null);
    });

    test('7 - Should return null if post returns 204', () async {
      client.mockPost(204, body: ''); 
      final response = await sut.request(url: url, method: 'post');
      expect(response, null);
    });

    test('8 - Should return null if post returns 204 with data', () async {
      client.mockPost(204); 
      final response = await sut.request(url: url, method: 'post');
      expect(response, null);
    });

    // Tests with body is not necessary, because it is the same as without body
    test('9 - Should return ValidationError if post returns 422 with body', () async {
      client.mockPost(422, body: ''); 
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.validationError));
    });

    test('9 - Should return ValidationError if post returns 422', () async {
      client.mockPost(422); 
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.validationError));
    });

    test('10 - Should return ServerError if post returns 500', () async {
      client.mockPost(500); 
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.serverError));
    });

    // Is an error different from the others
    test('11 - Should return ServerError if post throws with 404', () async {
      client.mockPost(404); 
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.serverError));
    });

    test('12 - Should return ServerError if post throws', () async {
      client.mockPostError(); 
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.serverError));
    });

    test('13 - Should throw ServerError if invalid method is provided', () {
      final future = sut.request(url: url, method: 'invalid_method');
      expect(() => future, throwsA(HttpError.serverError));
    });
  });  
}