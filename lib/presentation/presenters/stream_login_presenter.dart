import 'dart:async';

import '../dependencies/dependencies.dart';

class LoginState {
  String emailError;
}

class StreamLoginPresenter {
  StreamLoginPresenter({this.validation});

  final Validation validation;
  final _controller = StreamController<LoginState>.broadcast();

  var _state = LoginState();

  Stream<String> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError);

  void validateEmail(String email) {
    _state.emailError = validation.validate(field: 'email', value: email);
    _controller.add(_state);
  }
}
