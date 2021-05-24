import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'factories/factories.dart';
import '../ui/components/components.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: createAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => createSplashPage(),
            transition: Transition.fade),
        GetPage(
            name: '/login',
            page: () => createLoginPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/surveys',
            page: () => Scaffold(body: Text('Survey')),
            transition: Transition.fadeIn),
      ],
    );
  }
}
