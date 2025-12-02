import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';
 // Import the PersonalisationPage

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

//  testWidgets('AboutPage displays main content', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MaterialApp(
//         home: AboutPage(),
//       ),
//     );

//     // Check for header
//     expect(find.text('About us'), findsOneWidget);

//     // Check for welcome text
//     expect(find.text('Welcome to the Union Shop!'), findsOneWidget);

//     // Check for personalisation service link text
//     expect(find.textContaining('personalisation service'), findsOneWidget);

//     // Check for footer email subscribe button
//     expect(find.text('Subscribe'), findsOneWidget);
//   });
  });
} 
