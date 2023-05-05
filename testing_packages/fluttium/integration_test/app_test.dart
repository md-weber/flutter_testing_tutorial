import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_tutorial/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var emailField = find.byType(TextFormField).first;
      var passwordField = find.byType(TextFormField).last;
      var loginButton = find.byType(ElevatedButton).first;

      // Enter text for the email address
      await tester.enterText(emailField, 'flutterexp@gmail.com');
      await Future.delayed(Duration(seconds: 1));

      // Enter text for the password
      await tester.enterText(passwordField, '123456');
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      var firstCheckbox = find.byType(Checkbox).first;

      expect(
        tester.getSemantics(firstCheckbox),
        matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: false,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true),
      );

      await tester.tap(firstCheckbox);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 1));

      expect(
        tester.getSemantics(firstCheckbox),
        matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true),
      );
    });
  });
}
