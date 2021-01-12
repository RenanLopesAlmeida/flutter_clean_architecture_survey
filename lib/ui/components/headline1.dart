import 'package:flutter/material.dart';

class Headline1 extends StatelessWidget {
  final String label;

  const Headline1({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
