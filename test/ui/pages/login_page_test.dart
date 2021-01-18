import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_clean_architecture_survey/ui/pages/pages.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    final loginPage = MaterialApp(home: LoginPage());

    await tester.pumpWidget(loginPage);

    final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'), matching: find.byType(Text));

    expect(
      emailTextChildren,
      findsOneWidget,
      reason:
          'when a TextFormField has only one text child, means it has no errors. Since one of the childs is always the label/hint text',
    );

    final passwordTextChildren = find.descendant(
        of: find.bySemanticsLabel('Password'), matching: find.byType(Text));

    expect(
      passwordTextChildren,
      findsOneWidget,
      reason:
          'when a TextFormField has only one text child, means it has no errors. Since one of the childs is always the label/hint text',
    );

    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.onPressed, null);
  });
}
