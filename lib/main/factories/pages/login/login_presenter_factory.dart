import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

LoginPresenter createGetxLoginPresenter() {
  return GetxLoginPresenter(
      authentication: createRemoteAuthentication(),
      validation: createLoginValidation(),
      saveCurrentAccount: createLocalSaveCurrentAccount());
}
