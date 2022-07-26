import 'package:get/get.dart';

import '../protocols/protocols.dart';
import 'package:ignis_insight/ui/helpers/helpers.dart';

class GetxLoginPresenter extends GetxController  {
  final Validation validation;

  String? _email;
  String? _password;

  final _emailError = Rx<UIError?>(null);
  final _passwordError = Rx<UIError?>(null);

  Stream<UIError?> get emailErrorStream => _emailError.stream;
  Stream<UIError?> get passwordErrorStream => _passwordError.stream;

  GetxLoginPresenter({
    required this.validation
  });

  UIError? _validateField({required String field}) {
    final formData = {
      'email': _email,
      'password': _password
    };
    validation.validate(field: field, input: formData);
    return null;
  }

  void validateEmail(String email) {
    _email = email;
    _validateField(field: 'email');
  }
}