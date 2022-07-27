import '../helpers.dart';

enum UIError {
  invalidField,
  requiredField,
  unexpected,
  validationError
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.invalidField: return R.strings.msgInvalidField;
      case UIError.requiredField: return R.strings.msgRequiredField;
      case UIError.validationError: return R.strings.msgValidationError;
      default: return R.strings.msgUnexpectedError;
    }
  }
}