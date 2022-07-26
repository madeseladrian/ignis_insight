import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:ignis_insight/infra/cache/cache.dart';
import '../mocks/mocks.dart';
 
void main() {
  late String key;
  late String value;
  late FlutterSecureStorageSpy secureStorage;
  late SecureStorageAdapter sut;

  setUp(() {
    key = faker.lorem.word();
    value = faker.guid.guid();
    secureStorage = FlutterSecureStorageSpy();
    sut = SecureStorageAdapter(secureStorage: secureStorage);
  });

  test('1 - Should call save secure with correct value', () async {
    await sut.save(key: key, value: value);
    verify(() => secureStorage.write(key: key, value: value));
  });
}