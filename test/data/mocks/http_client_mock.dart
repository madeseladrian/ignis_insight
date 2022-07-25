import 'package:ignis_insight/data/http/http_client.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockRequestCall() => when(() => request(
    url: any(named: 'url')
  ));

  void mockRequest() => mockRequestCall().thenAnswer((_) async => _); 
}