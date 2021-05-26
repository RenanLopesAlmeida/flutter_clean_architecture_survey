import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({@required this.presenter});
  final SplashPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (_) {
          presenter.checkAccount();
          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
