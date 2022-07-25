import '../helpers.dart';

enum UIError {
  invalidField,
  requiredField,
  unexpected
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField: return R.strings.msgRequiredField;
      case UIError.invalidField: return R.strings.msgInvalidField;
      default: return R.strings.msgUnexpectedError;
    }
  }
}