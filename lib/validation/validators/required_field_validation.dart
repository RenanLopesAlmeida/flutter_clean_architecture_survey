import 'package:equatable/equatable.dart';

import '../dependencies/dependencies.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  const RequiredFieldValidation(this.field);
  final String field;

  List<String> get props => [field];

  @override
  String validate(String value) {
    return (value?.isNotEmpty == true) ? null : 'Campo obrigatório';
  }
}
