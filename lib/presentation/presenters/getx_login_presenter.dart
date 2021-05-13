import 'package:get/state_manager.dart';
import 'package:meta/meta.dart';

import '../../domain/helpers/domain_error.dart';
import '../../ui/pages/pages.dart';

import '../../domain/usecases/usecases.dart';

import '../dependencies/dependencies.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  GetxLoginPresenter({
    @required this.authentication,
    @required this.validation,
    @required this.saveCurrentAccount,
  });

  final Validation validation;
  final Authentication authentication;
  final SaveCurrentAccount saveCurrentAccount;

  String _email;
  String _password;
  var _emailError = RxString(null);
  var _passwordError = RxString(null);
  var _mainError = RxString(null);
  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get emailErrorStream => _emailError.stream;

  Stream<String> get passwordErrorStream => _passwordError.stream;

  Stream<bool> get isFormValidStream => _isFormValid.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  Stream<String> get mainErrorStream => _mainError.stream;

  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: 'email', value: email);
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        validation.validate(field: 'password', value: password);
    _validateForm();
  }

  void _validateForm() {
    _isFormValid.value =
        (_emailError.value == null && _passwordError.value == null) &&
            (_email != null && _password != null);
  }

  Future<void> auth() async {
    _isLoading.value = true;

    try {
      final account = await authentication.auth(AuthenticationParams(
        email: _email,
        password: _password,
      ));

      await saveCurrentAccount.save(account);
    } on DomainError catch (error) {
      _mainError.value = error.description;
    }

    _isLoading.value = false;
  }

  void dispose() {
    super.dispose();
  }
}
