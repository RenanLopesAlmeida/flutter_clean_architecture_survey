import 'package:test/test.dart';
import 'package:flutter_clean_architecture_survey/main/factories/pages/pages.dart';
import 'package:flutter_clean_architecture_survey/validation/validators/validators.dart';

void main() {
  test('Should return the correct validations', () {
    final validations = makeLoginValidations();

    expect(validations, [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
    ]);
  });
}
