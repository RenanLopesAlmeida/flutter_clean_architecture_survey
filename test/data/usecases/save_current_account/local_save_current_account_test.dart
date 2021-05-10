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
  LocalSaveCurrentAccount sut;
  SaveSecureCacheStorageSpy saveSecureCacheStorage;
  AccountEntity account;

  setUp(() {
    saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    sut = LocalSaveCurrentAccount(
      saveSecureCacheStorage: saveSecureCacheStorage,
    );
    account = AccountEntity(faker.guid.guid());
  });
  test('Should call SaveSecureCacheStorage with correct values', () async {
    await sut.save(account);

    verify(saveSecureCacheStorage.save(key: 'token', value: account.token));
  });

  test('Should throw an UnexpectedError if SaveSecureCacheStorage throws',
      () async {
    when(saveSecureCacheStorage.save(
            key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(
      Exception(),
    );

    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });
}
