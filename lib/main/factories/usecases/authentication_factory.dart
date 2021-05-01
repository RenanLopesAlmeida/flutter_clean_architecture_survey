import '../../../main/factories/http/http.dart';
import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';

Authentication createRemoteAuthentication() {
  return RemoteAuthentication(
    httpClient: createHttpAdapter(),
    url: createApiUrl('login'),
  );
}
