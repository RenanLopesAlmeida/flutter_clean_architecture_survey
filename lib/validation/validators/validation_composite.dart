import 'package:meta/meta.dart';
import '../../presentation/dependencies/dependencies.dart';
import '../../validation/dependencies/dependencies.dart';

class ValidationComposite implements Validation {
  ValidationComposite(this.validations);

  List<FieldValidation> validations;
  @override
  String validate({@required String field, @required String value}) {
    String error;
    final sameFieldValidation =
        validations.where((v) => v.field == field).toList();

    for (final validation in sameFieldValidation) {
      error = validation.validate(value);
      if (error?.isNotEmpty == true) {
        return error;
      }
    }

    return error;
  }
}
