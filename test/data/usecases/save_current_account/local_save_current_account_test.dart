import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:ignis_insight/domain/entities/entities.dart';
import 'package:ignis_insight/data/usecases/usecases.dart';
import '../../mocks/mocks.dart';

void main() {
  late AccountEntity accountEntity;
  late SecureCacheStorageSpy saveSecureCacheStorage;
  late LocalSaveCurrentAccount sut;

  setUp(() {
    accountEntity = AccountEntity(token: faker.guid.guid());
    saveSecureCacheStorage = SecureCacheStorageSpy();
    sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
  });

  test('1 - Should call SaveSecureCacheStorage with correct values', () async {
    await sut.save(accountEntity);
    verify(() => saveSecureCacheStorage.save(
      key: 'token', value: accountEntity.token
    ));
  });
}