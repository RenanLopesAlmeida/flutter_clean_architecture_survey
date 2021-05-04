import '../../../../presentation/dependencies/dependencies.dart';
import '../../../../validation/validators/validators.dart';
import '../../../../validation/dependencies/dependencies.dart';

Validation createLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ];
}
