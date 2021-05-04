import '../../../../presentation/dependencies/dependencies.dart';
import '../../../../validation/validators/validators.dart';
import '../../../../validation/dependencies/dependencies.dart';
import '../../../builders/builders.dart';

Validation createLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
