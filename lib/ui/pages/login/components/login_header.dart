import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignis_insight/ui/pages/login/login.dart';

import '../../../components/components.dart';
import '../../../helpers/i18n/i18n.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          HeaderTextWidget(
            name: R.strings.login,
            onTap: () {},
          ),
          HeaderTextWidget(
            key: const Key('support header'),
            name: R.strings.support,
            onTap: presenter.support,
          )
        ],
      )
    );
  }
}