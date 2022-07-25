import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
 
import 'package:ignis_insight/ui/pages/pages.dart';
import 'package:mocktail/mocktail.dart';

class LoginPresenterSpy extends Mock implements LoginPresenter {}

void main() {
  late LoginPresenter presenter;

  Future<void> _testPage(WidgetTester tester) async {
    presenter = LoginPresenterSpy();

    final page = GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage(presenter: presenter))
      ],
    );
    await tester.pumpWidget(page);
  }

  testWidgets('1,2,3 - Should load with correct initial state', (WidgetTester tester) async {
    await _testPage(tester);
    final emailTextChildren = find.descendant(
      of: find.bySemanticsLabel('Email'), 
      matching: find.byType(Text)
    );
    expect(
      emailTextChildren, 
      findsOneWidget,
      reason: 'When a TextFormField has only one text child, means it has no errors, ' 
      'since one of the childs is always the label text'   
    );

    final passwordTextChildren = find.descendant(
      of: find.bySemanticsLabel('Senha'),
      matching: find.byType(Text),
    );
    expect(
      passwordTextChildren, 
      findsOneWidget,  
    );

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, null);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('4 - Should call validate with correct email', (WidgetTester tester) async {
    await _testPage(tester);

    final email = faker.internet.email();
    await tester.enterText(find.bySemanticsLabel('Email'), email);
    verify(() => presenter.validateEmail(email));
  });
}