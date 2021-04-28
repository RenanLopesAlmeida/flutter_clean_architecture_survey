import 'package:flutter_clean_architecture_survey/validation/dependencies/dependencies.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation {
  const EmailValidation(this.field);
  final String field;

  String validate(String value) => null;
}

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null if email is empty', () {
    expect(sut.validate(''), null);
  });

  test('Should return null if email is null', () {
    expect(sut.validate(null), null);
  });

  test('Should return null if email is valid', () {
    expect(sut.validate('user@gmail.com'), null);
  });
}
