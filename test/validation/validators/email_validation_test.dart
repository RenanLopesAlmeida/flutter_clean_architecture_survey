import 'package:test/test.dart';
import '../../../lib/validation/validators/validators.dart';

const invalidEmailMessage = 'Invalid Field';

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
