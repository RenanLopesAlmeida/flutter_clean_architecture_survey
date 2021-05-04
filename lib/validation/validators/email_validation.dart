import 'package:equatable/equatable.dart';

import '../dependencies/dependencies.dart';

class EmailValidation extends Equatable implements FieldValidation {
  const EmailValidation(this.field);
  final String field;

  List<String> get props => [field];

  String validate(String value) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    final isValid =
        value == null || value?.isEmpty == true || regex.hasMatch(value);
    return (isValid) ? null : 'Invalid Field';
  }
}
