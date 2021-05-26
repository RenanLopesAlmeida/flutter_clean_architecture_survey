import '../../cache/cache.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount {
  const LocalLoadCurrentAccount(this.fetchSecureCacheStorage);
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  Future<AccountEntity> load() async {
    try {
      final token = await fetchSecureCacheStorage.fetchSecure('token');
      return AccountEntity(token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
