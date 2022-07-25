import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientSpy extends Mock implements Client {
  ClientSpy() {
    mockPost(200);
  }

  When mockPostCall() => when(() => this.post(
    any(),
    headers: any(named: 'headers'),
    encoding: any(named: 'encoding'),
    body: any(named: 'body')
  ));

  void mockPost(int statusCode, {String body = '{"any_key":"any_value"}'}) => 
    mockPostCall().thenAnswer((_) async => Response(body, statusCode));

  void mockPostError() => when(() => mockPostCall().thenThrow(Exception()));
}