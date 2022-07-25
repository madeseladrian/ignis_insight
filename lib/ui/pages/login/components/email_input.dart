import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/helpers.dart';
import '../login.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.email,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: presenter.validateEmail,
    );
  }
}