import 'package:flutter_clean_architecture_survey/validation/dependencies/dependencies.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:meta/meta.dart';
import 'package:flutter_clean_architecture_survey/presentation/dependencies/dependencies.dart';

class ValidationComposite implements Validation {
  ValidationComposite(this.validations);

  List<FieldValidation> validations;
  @override
  String validate({@required String field, @required String value}) {
    return null;
  }
}

class FieldValidationSpy extends Mock implements FieldValidation {}

void main() {
  test('Should return null if all validations returns null or empty', () {
    final validation1 = FieldValidationSpy();
    final validation2 = FieldValidationSpy();

    when(validation1.field).thenReturn('any_field');
    when(validation1.validate(any)).thenReturn(null);

    when(validation2.field).thenReturn('any_field');
    when(validation2.validate(any)).thenReturn('');

    final sut = ValidationComposite([validation1, validation2]);
    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
}
