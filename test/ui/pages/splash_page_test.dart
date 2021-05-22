import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mockito/mockito.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({@required this.presenter});
  final SplashPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (_) {
        presenter.loadCurrentAccount();
        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}

abstract class SplashPresenter {
  Future<void> loadCurrentAccount();
}

class SplashPresenterSpy extends Mock implements SplashPresenter {}

void main() {
  SplashPresenterSpy presenter;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = SplashPresenterSpy();

    await tester.pumpWidget(GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashPage(presenter: presenter))
      ],
    ));
  }

  testWidgets('Should present spinner on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should call loadCurrentAccount on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    verify(presenter.loadCurrentAccount()).called(1);
  });
}
