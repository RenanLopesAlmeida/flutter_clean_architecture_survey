import 'dart:async';

import '../dependencies/dependencies.dart';

class LoginState {
  String emailError;
  bool get isFormValid => false;
}

class StreamLoginPresenter {
  StreamLoginPresenter({this.validation});

  final Validation validation;
  final _controller = StreamController<LoginState>.broadcast();

  var _state = LoginState();

  Stream<String> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError).distinct();

  Stream<bool> get isFormValidStream =>
      _controller.stream.map((state) => state.isFormValid).distinct();

  void validateEmail(String email) {
    _state.emailError = validation.validate(field: 'email', value: email);
    _controller.add(_state);
  }

  void validatePassword(String password) {
    validation.validate(field: 'password', value: password);
  }
}
