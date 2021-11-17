import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sorfian_test/main.dart' as app;
import 'package:sorfian_test/ui/pages/pages.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets(
      'Load all contacts in MyHomePage',
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.byType(MyHomePage), findsOneWidget);
      },
    );

    testWidgets(
      'Search contact name Andyanto Feng by input text "and"',
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        const inputText = 'and';
        await tester.enterText(
            find.byType(CupertinoSearchTextField), inputText);

        await tester.pumpAndSettle();
        await tester.pump(const Duration(seconds: 3));

        expect(find.text('Andyanto Feng'), findsOneWidget);
        await tester.pump(const Duration(seconds: 3));
      },
    );

    testWidgets(
      'Search contact name Tasya Putri by input text "putri"',
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        const inputText = 'putri';
        await tester.enterText(
            find.byType(CupertinoSearchTextField), inputText);

        await tester.pumpAndSettle();
        await tester.pump(const Duration(seconds: 3));

        expect(find.text('Tasya Putri'), findsOneWidget);
        await tester.pump(const Duration(seconds: 3));
      },
    );
    testWidgets('Tap on the plus button, go to AddNewContactPage',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.byType(AddNewContactPage), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('Tap on the plus button, verify to add new contact',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));

      await tester.tap(find.byKey(AddNewContactPage.saveButton),
          warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.byType(MyHomePage), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });
  });
}
