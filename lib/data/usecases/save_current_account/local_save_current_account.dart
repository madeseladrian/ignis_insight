import '../../../domain/entities/account_entity.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

import '../../cache/cache.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({required this.saveSecureCacheStorage});

  @override
  Future<void> save(AccountEntity accountEntity) async {
    try {
      await saveSecureCacheStorage.save(
        key: 'token',
        value: accountEntity.token
      );
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}