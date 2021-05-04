import '../../../../main/factories/factories.dart';
import '../../../../main/factories/usecases/authentication_factory.dart';
import '../../../../presentation/presenters/stream_login_presenter.dart';
import '../../../../ui/pages/pages.dart';

LoginPresenter createLoginPresenter() {
  return StreamLoginPresenter(
    authentication: createRemoteAuthentication(),
    validation: createLoginValidation(),
  );
}