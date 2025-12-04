import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sign_up_page.dart';

void main() {
  group('SignUpPage Tests', () {
    testWidgets('SignUpPage displays logo', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('The UNION'), findsOneWidget);
    });

    testWidgets('SignUpPage displays create account heading',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Create Account'), findsOneWidget);
    });

    testWidgets('SignUpPage displays subtitle', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Join The Union today'), findsOneWidget);
    });

    testWidgets('SignUpPage displays all input fields',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsNWidgets(4));
    });

    testWidgets('SignUpPage name field accepts input',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      final nameField = find.byType(TextField).first;
      await tester.enterText(nameField, 'John Doe');
      await tester.pumpAndSettle();

      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('SignUpPage email field accepts input',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(1), 'john@example.com');
      await tester.pumpAndSettle();

      expect(find.text('john@example.com'), findsOneWidget);
    });

    testWidgets('SignUpPage displays back button',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('SignUpPage shows error when fields are empty',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      final createButton = find.byType(ElevatedButton);
      await tester.tap(createButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Please fill in all fields'), findsOneWidget);
    });

    testWidgets('SignUpPage shows error when passwords do not match',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'John Doe');
      await tester.enterText(textFields.at(1), 'john@example.com');
      await tester.enterText(textFields.at(2), 'password123');
      await tester.enterText(textFields.at(3), 'password456');
      await tester.pumpAndSettle();

      final createButton = find.byType(ElevatedButton);
      await tester.tap(createButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Passwords do not match'), findsOneWidget);
    });

    testWidgets('SignUpPage displays create account button',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Create Account'), findsWidgets);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('SignUpPage displays sign in link',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Already have an account?'), findsOneWidget);
      expect(find.text('Sign in'), findsOneWidget);
    });

    testWidgets('SignUpPage has scaffold', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('SignUpPage is scrollable', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('SignUpPage is responsive on mobile',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 1200);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('The UNION'), findsOneWidget);
      expect(find.text('Create Account'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(4));
    });

    testWidgets('SignUpPage password fields are obscured by default',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility_off), findsNWidgets(2));
    });

    testWidgets('SignUpPage renders without errors',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 1600);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SignUpPage), findsOneWidget);
    });
  });
}