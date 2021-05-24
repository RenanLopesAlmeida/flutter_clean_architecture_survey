import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxSplashPresenter implements SplashPresenter {
  GetxSplashPresenter({@required this.loadCurrentAccount});
  final LoadCurrentAccount loadCurrentAccount;

  var _navigateTo = RxString(null);

  Stream<String> get navigateToStream => _navigateTo.stream;

  Future<void> checkAccount({int durationInMilliseconds = 1500}) async {
    await Future.delayed(Duration(milliseconds: durationInMilliseconds));

    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = account == null ? '/login' : '/surveys';
    } catch (error) {
      _navigateTo.value = '/login';
    }
  }
}
