import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';
import 'package:flutter/gestures.dart';
import 'package:union_shop/personalisation_page.dart'; // Import the PersonalisationPage

void main() {
  group('AboutPage Tests', () {
    testWidgets('AboutPage button works and navigates to AboutPage', (WidgetTester tester) async {
      // Create a mock app with navigation
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    tester.element(find.byType(TextButton)),
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
                child: const Text('Go to About Page'),
              ),
            ),
          ),
        ),
      );

      // Verify the initial state
      expect(find.text('Go to About Page'), findsOneWidget);
      expect(find.text('About us'), findsNothing);

      // Tap the button to navigate to AboutPage
      await tester.tap(find.text('Go to About Page'));
      await tester.pumpAndSettle();

      // Verify navigation to AboutPage
      expect(find.text('About us'), findsOneWidget);
    });

    testWidgets('Subscribe button triggers onEmailSubmitted callback', (WidgetTester tester) async {
      String? submittedEmail;

      // Build the AboutPage widget with a mock onEmailSubmitted callback
      await tester.pumpWidget(
        MaterialApp(
          home: AboutPage(
            onEmailSubmitted: (email) {
              submittedEmail = email;
            },
          ),
        ),
      );

      // Enter an email address
      await tester.enterText(find.byType(TextField), 'test@example.com');

      // Tap the Subscribe button
      await tester.tap(find.text('Subscribe'));
      await tester.pump(); // Trigger the button press

      // Verify the email was submitted
      expect(submittedEmail, equals('test@example.com'));
    });

    testWidgets('Clicking "personalisation service" navigates to PersonalisationPage', (WidgetTester tester) async {
      // Pump the AboutPage widget with navigation setup
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/personalisation': (context) => const PersonalisationPage(),
          },
        ),
      );

      // Verify the "personalisation service" text exists
      expect(find.text('personalisation service'), findsOneWidget);

      // Tap the "personalisation service" text
      await tester.tap(find.text('personalisation service'));
      await tester.pumpAndSettle(); // Wait for navigation to complete

      // Verify that the PersonalisationPage is displayed
      expect(find.text('Personalisation Service'), findsOneWidget);
      expect(find.text('Customize your products with our exclusive personalisation service!'), findsOneWidget);
    });
  });
}