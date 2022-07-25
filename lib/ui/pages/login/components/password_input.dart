import 'package:flutter/material.dart';
import '../../../helpers/i18n/resources.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.password
      ),
      obscureText: true
    );
  }
}