import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import '../ui/components/components.dart';
import '../ui/helpers/helpers.dart';
import 'factories/factories.dart';

void main() {
  R.load(const Locale('pt', 'BR'));
  //R.load(const Locale('en', 'US'));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    
    return GetMaterialApp(
      title: 'Ignis',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: makeLoginPage),
        GetPage(name: '/initial', page: () => const Scaffold(body: Center(child: Text('Initial')))),
        GetPage(name: '/support', page: () => const Scaffold(body: Center(child: Text('Support')))),
        GetPage(name: '/recoverPassword', page: () => const Scaffold(body: Center(child: Text('Recover Password')))),
      ]
    );
  }
}