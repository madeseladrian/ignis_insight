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
    test('1 - Should call post with correct url', () async {
      sut.request(url: url);
      verify(() => client.post(
        Uri.parse(url)
      ));
    });
  });  
}