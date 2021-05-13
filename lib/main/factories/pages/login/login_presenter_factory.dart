import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

LoginPresenter createStreamLoginPresenter() {
  return StreamLoginPresenter(
    authentication: createRemoteAuthentication(),
    validation: createLoginValidation(),
  );
}

LoginPresenter createGetxLoginPresenter() {
  return GetxLoginPresenter(
      authentication: createRemoteAuthentication(),
      validation: createLoginValidation(),
      saveCurrentAccount: createLocalSaveCurrentAccount());
}
