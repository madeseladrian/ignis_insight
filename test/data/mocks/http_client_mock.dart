import 'package:mocktail/mocktail.dart';
import 'package:ignis_insight/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockRequestCall() => when(() => request(
    url: any(named: 'url'),
    method: any(named: 'method'),
    body: any(named: 'body')
  ));

  void mockRequest(dynamic data) => 
    mockRequestCall().thenAnswer((_) async => data); 

  void mockError(HttpError error) => mockRequestCall().thenThrow(error);
}