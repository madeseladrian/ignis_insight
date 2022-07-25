import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
 
import 'package:ignis_insight/ui/pages/pages.dart';

void main() {

  Future<void> _testPage(WidgetTester tester) async {
    final page = GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage())
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
}