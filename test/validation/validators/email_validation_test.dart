import 'package:flutter_clean_architecture_survey/validation/dependencies/dependencies.dart';
import 'package:test/test.dart';

const invalidEmailMessage = 'Invalid Field';

class EmailValidation implements FieldValidation {
  const EmailValidation(this.field);
  final String field;

  String validate(String value) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    final isValid = value?.isEmpty == true || regex.hasMatch(value);
    return (isValid) ? null : invalidEmailMessage;
  }
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

  test('Should return an error message if email is invalid', () {
    expect(sut.validate('user@gmail'), invalidEmailMessage);
  });
}
