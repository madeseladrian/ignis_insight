import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/helpers.dart';
import '../login.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    return StreamBuilder<UIError?>(
      stream: presenter.emailErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.strings.email,
            errorText: snapshot.data?.description
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: presenter.validateEmail,
        );
      }
    );
  }
}