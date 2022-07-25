import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/i18n/resources.dart';
import '../login.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.password
      ),
      obscureText: true,
      onChanged: presenter.validatePassword,
    );
  }
}