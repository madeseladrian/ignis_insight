import 'package:flutter/material.dart';
import '../../../helpers/helpers.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 36.0),
      child: ElevatedButton(
        onPressed: null,
        child: Text(R.strings.enter)
      ),
    );
  }
}