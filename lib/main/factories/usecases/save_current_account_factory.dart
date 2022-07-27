import '../../../domain/usecases/usecases.dart';
import '../../../data/usecases/usecases.dart';
import '../../factories/cache/cache.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
    saveSecureCacheStorage: makeSecureStorageAdapter()
  );
}