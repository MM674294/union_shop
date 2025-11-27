import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_page.dart';

void main() {
  
  group('SalePage Tests', () {
    testWidgets('Displays correct content on SalePage', (WidgetTester tester) async {
      // Pump the SalePage widget
      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );

      // Verify the content of the SalePage
      expect(find.text('SALE'), findsOneWidget);
      expect(find.text('Don’t miss out! Get yours before they’re all gone!\n All prices shown are inclusive of the discount 🛒'), findsOneWidget);
      expect(find.text('Subscribe'), findsOneWidget);
    });

    testWidgets('Subscribe button can be tapped', (WidgetTester tester) async {
      // Pump the SalePage widget
      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );

      // Tap the Subscribe button
      await tester.tap(find.text('Subscribe'));
      await tester.pump(); // Trigger the button press

      // Verify the button press (check console for print statement)
      // Since the button only prints to the console, we can't directly verify the print statement in the test.
      // However, this ensures the button is tappable and doesn't throw errors.
    });

    testWidgets('Navigation to SalePage works', (WidgetTester tester) async {
      // Create a mock app with navigation
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Home Page'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sale');
                        },
                        child: const Text('Go to Sale Page'),
                      ),
                    ],
                  ),
                  body: const Center(
                    child: Text('Home Page Content'),
                  ),
                ),
            '/sale': (context) => const SalePage(),
          },
        ),
      );

      // Verify the initial state (Home Page)
      expect(find.text('Home Page Content'), findsOneWidget);
      expect(find.text('SALE'), findsNothing);

      // Tap the "Go to Sale Page" button
      await tester.tap(find.text('Go to Sale Page'));
      await tester.pumpAndSettle();

      // Verify navigation to SalePage
      expect(find.text('SALE'), findsOneWidget);
      expect(find.text('Don’t miss out! Get yours before they’re all gone!\n All prices shown are inclusive of the discount 🛒'), findsOneWidget);
    });
  });
}