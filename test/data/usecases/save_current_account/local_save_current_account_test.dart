import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:flutter_clean_architecture_survey/domain/helpers/helpers.dart';
import 'package:flutter_clean_architecture_survey/domain/entities/entities.dart';
import 'package:flutter_clean_architecture_survey/domain/usecases/save_current_account.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  const LocalSaveCurrentAccount({@required this.saveSecureCacheStorage});
  final SaveSecureCacheStorage saveSecureCacheStorage;

  Future<void> save(AccountEntity account) async {
    try {
      await saveSecureCacheStorage.save(key: 'token', value: account.token);
    } catch (error) {
      return throw DomainError.unexpected;
    }
  }
}

abstract class SaveSecureCacheStorage {
  Future<void> save({@required String key, @required String value});
}

class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage {
}

void main() {
  test('Should call SaveSecureCacheStorage with correct values', () async {
    final cacheStorage = SaveSecureCacheStorageSpy();
    final sut = LocalSaveCurrentAccount(saveSecureCacheStorage: cacheStorage);
    final account = AccountEntity(faker.guid.guid());

    await sut.save(account);

    verify(cacheStorage.save(key: 'token', value: account.token));
  });

  test('Should throw an UnexpectedError if SaveSecureCacheStorage throws',
      () async {
    final saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    final sut = LocalSaveCurrentAccount(
      saveSecureCacheStorage: saveSecureCacheStorage,
    );
    final account = AccountEntity(faker.guid.guid());

    when(saveSecureCacheStorage.save(
            key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(
      Exception(),
    );

    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });
}
