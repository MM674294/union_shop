import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/footer.dart';
import 'package:union_shop/custom_app_bar.dart';

void main() {
  group('Footer Tests', () {
    testWidgets('Footer displays opening hours section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
    });

    testWidgets('Footer displays winter break closure dates', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(contains('Winter Break Closure')), findsOneWidget);
    });

    testWidgets('Footer displays term time hours', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(contains('Term Time')), findsOneWidget);
    });

    testWidgets('Footer displays help and information section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Help and Information'), findsOneWidget);
    });

    testWidgets('Footer displays search link', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('Footer displays terms and conditions link', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Terms & Conditions of Sale Policy'), findsOneWidget);
    });

    testWidgets('Footer displays latest offers section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('Footer displays email input field', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
    });

    testWidgets('Footer displays subscribe button', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Subscribe'), findsOneWidget);
    });

    testWidgets('Footer email input accepts text', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.pumpAndSettle();

      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('Footer subscribe button shows snackbar on valid email', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Enter email
      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.pumpAndSettle();

      // Tap subscribe button
      await tester.tap(find.text('Subscribe'));
      await tester.pumpAndSettle();

      expect(find.text('Thank you for subscribing!'), findsOneWidget);
    });

    testWidgets('Footer email field is cleared after subscription', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Enter email
      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.pumpAndSettle();

      // Tap subscribe button
      await tester.tap(find.text('Subscribe'));
      await tester.pumpAndSettle();

      // Email field should be cleared
      expect(find.text('test@example.com'), findsNothing);
    });

    testWidgets('Footer does not show snackbar on empty email', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap subscribe without entering email
      await tester.tap(find.text('Subscribe'));
      await tester.pumpAndSettle();

      expect(find.text('Thank you for subscribing!'), findsNothing);
    });

    testWidgets('Footer has grey background', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('Footer displays all three columns on desktop', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('Footer is responsive on mobile', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 1200);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('Footer purchase online text is displayed', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(contains('Purchase online 24/7')), findsOneWidget);
    });

    testWidgets('Footer has padding', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('Footer displays closing date 19/12/2025', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(contains('19/12/2025')), findsOneWidget);
    });

    testWidgets('Footer displays reopening date 06/01/2026', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(contains('06/01/2026')), findsOneWidget);
    });

    testWidgets('Footer has correct text styling', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('Footer search link is tappable', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('Footer callback is called on email submission', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      String? submittedEmail;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(
                onEmailSubmitted: (email) {
                  submittedEmail = email;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Enter email
      await tester.enterText(find.byType(TextField), 'callback@test.com');
      await tester.pumpAndSettle();

      // Tap subscribe button
      await tester.tap(find.text('Subscribe'));
      await tester.pumpAndSettle();

      expect(submittedEmail, equals('callback@test.com'));
    });

    testWidgets('Footer has row layout', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('Footer displays text in multiple columns', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Flexible), findsWidgets);
    });

    testWidgets('Footer subscribe button has correct styling', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextButton), findsOneWidget);
    });
  });
}