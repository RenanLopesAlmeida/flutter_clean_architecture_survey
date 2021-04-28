import 'package:flutter_clean_architecture_survey/validation/dependencies/dependencies.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation {
  const EmailValidation(this.field);
  final String field;

  String validate(String value) => null;
}

void main() {
  test('Should return null if email is empty', () {
    final sut = EmailValidation('any_field');
    expect(sut.validate(''), null);
  });
}
