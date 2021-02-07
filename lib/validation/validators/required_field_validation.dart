import '../dependencies/dependencies.dart';

class RequiredFieldValidation implements FieldValidation {
  const RequiredFieldValidation(this.field);
  final String field;

  @override
  String validate(String value) {
    return (value?.isNotEmpty == true) ? null : 'Campo obrigatório';
  }
}
