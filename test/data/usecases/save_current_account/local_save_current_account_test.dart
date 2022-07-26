import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:ignis_insight/domain/entities/entities.dart';
import 'package:ignis_insight/domain/helpers/helpers.dart';

import 'package:ignis_insight/data/usecases/usecases.dart';
import '../../mocks/mocks.dart';

void main() {
  late AccountEntity accountEntity;
  late SecureCacheStorageSpy secureCacheStorage;
  late LocalSaveCurrentAccount sut;

  setUp(() {
    accountEntity = AccountEntity(token: faker.guid.guid());
    secureCacheStorage = SecureCacheStorageSpy();
    sut = LocalSaveCurrentAccount(saveSecureCacheStorage: secureCacheStorage);
  });

  test('1 - Should call SecureCacheStorage with correct values', () async {
    await sut.save(accountEntity);
    verify(() => secureCacheStorage.save(
      key: 'token', value: accountEntity.token
    ));
  });

  test('2 - Should throw UnexpectedError if SecureCacheStorage throws', () async {
    secureCacheStorage.mockSaveError();
    final future = sut.save(accountEntity);
    expect(future, throwsA(DomainError.unexpected));
  });
}