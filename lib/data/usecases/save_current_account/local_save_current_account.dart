import '../../../domain/entities/account_entity.dart';
import '../../../domain/usecases/usecases.dart';

import '../../cache/cache.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({required this.saveSecureCacheStorage});

  @override
  Future<void> save(AccountEntity accountEntity) async {
    await saveSecureCacheStorage.save(
      key: 'token', 
      value: accountEntity.token
    );
  }
}