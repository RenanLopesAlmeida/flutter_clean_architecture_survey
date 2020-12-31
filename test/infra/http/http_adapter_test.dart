import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class ClientSpy extends Mock implements Client {}

class HttpAdapter {
  final ClientSpy client;

  HttpAdapter(this.client);

  Future<void> request({@required String url, @required String method}) async {
    await client.post(url);
  }
}

main() {
  group('post', () {
    test('Should call post with correct values', () async {
      final client = ClientSpy();
      final sut = HttpAdapter(client);
      final url = faker.internet.httpsUrl();

      await sut.request(url: url, method: 'post');

      verify(client.post(url));
    });
  });
}
