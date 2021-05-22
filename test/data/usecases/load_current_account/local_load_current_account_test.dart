import 'package:faker/faker.dart';
import 'package:flutter_clean_architecture_survey/domain/helpers/domain_error.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:flutter_clean_architecture_survey/domain/entities/entities.dart';
import 'package:flutter_clean_architecture_survey/domain/usecases/usecases.dart';

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

abstract class FetchSecureCacheStorage {
  Future<String> fetchSecure(String key);
}

class FetchSecureCacheStorageSpy extends Mock
    implements FetchSecureCacheStorage {}

void main() {
  LocalLoadCurrentAccount sut;
  FetchSecureCacheStorageSpy fetchSecureCacheStorage;
  String token;

  PostExpectation mockFetchSecureCall() =>
      when(fetchSecureCacheStorage.fetchSecure(any));

  void mockFetchSecure() {
    mockFetchSecureCall().thenAnswer((_) async => token);
  }

  void mockFetchSecureError() {
    mockFetchSecureCall().thenThrow(Exception());
  }

  setUp(() {
    fetchSecureCacheStorage = FetchSecureCacheStorageSpy();
    sut = LocalLoadCurrentAccount(fetchSecureCacheStorage);
    token = faker.guid.guid();
    mockFetchSecure();
  });

  test('Should call FetchSecureCacheStorage with correct value', () async {
    await sut.load();
    verify(fetchSecureCacheStorage.fetchSecure('token'));
  });

  test('Should call an AccountEntity', () async {
    final account = await sut.load();
    expect(account, AccountEntity(token));
  });

  test('Should throw Unexpected error if FetchSecureCacheStorage throws',
      () async {
    mockFetchSecureError();

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}
