import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark,
            ],
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: 0,
              blurRadius: 4,
            ),
          ]),
      child: Image(
        image: AssetImage('lib/ui/assets/logo.png'),
      ),
    );
  }
}
