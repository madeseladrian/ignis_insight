import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/helpers.dart';
import '../login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    return StreamBuilder<bool>(
      stream: presenter.isFormValidStream,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 36.0),
          child: ElevatedButton(
            onPressed: snapshot.data == true ? presenter.auth : null,
            child: Text(R.strings.enter)
          ),
        );
      }
    );
  }
}