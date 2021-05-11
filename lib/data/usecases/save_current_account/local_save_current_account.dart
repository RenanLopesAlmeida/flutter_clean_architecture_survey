import 'package:meta/meta.dart';

import '../../cache/cache.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  const LocalSaveCurrentAccount({@required this.saveSecureCacheStorage});
  final SaveSecureCacheStorage saveSecureCacheStorage;

  Future<void> save(AccountEntity account) async {
    try {
      await saveSecureCacheStorage.saveSecure(
          key: 'token', value: account.token);
    } catch (error) {
      return throw DomainError.unexpected;
    }
  }
}
