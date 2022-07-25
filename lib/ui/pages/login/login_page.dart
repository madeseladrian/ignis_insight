import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import 'components/components.dart';
import 'login.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(presenter);
    
    return Container(
      decoration: boxImage,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (context) {
            presenter.isLoadingStream.listen((isLoading) {
              if (isLoading == true) {
                showLoading(context);
              } else {
                hideLoading(context);
              }
            });

            presenter.mainErrorStream.listen((error) {
              if (error != null) {
                showErrorMessage(context, error.description);
              }
            });

            presenter.navigateToStream.listen((page) {
              if (page != null && page.isNotEmpty) {
                if (page != '/initial' && page != '/login') {
                  Get.toNamed(page);
                } else {
                  Get.offAllNamed(page);
                }
              }
            });

            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LoginHeader(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.only(right: 24, left: 24, top: 16, bottom: 16),
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          EmailInput(),
                          PasswordInput(),
                          LoginButton()
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        HelpLogin(
                          key: const Key('recover password'),
                          text: R.strings.forgotPassword, 
                          routeText: R.strings.recoverPassword, 
                          onTap: presenter.recoverPassword
                        ),
                        HelpLogin(
                          key: const Key('support body'),
                          text: R.strings.needHelp, 
                          routeText: R.strings.clickHere, 
                          onTap: presenter.support
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                )
              ),
            );
          }
        ),
      ),
    );
  }
}