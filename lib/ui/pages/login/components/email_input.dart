import 'package:flutter/material.dart';
import '../../helpers/helpers.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.email,
      ),
      keyboardType: TextInputType.emailAddress
    );
  }
}