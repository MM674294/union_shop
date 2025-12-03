import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/footer.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Footer displays content and handles email subscription', (WidgetTester tester) async {
    String? submittedEmail;

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Footer(
              onEmailSubmitted: (email) {
                submittedEmail = email;
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check for main sections
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);

      // Check for Search link
      expect(find.text('Search'), findsOneWidget);

      // Check for Terms & Conditions text
      expect(find.textContaining('Terms & Conditions'), findsOneWidget);

      // Check for email input and Subscribe button
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Subscribe'), findsOneWidget);

      // Enter email and tap Subscribe
      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('Subscribe'));
      await tester.pump(); // Show SnackBar

      // Check that the callback was called
      expect(submittedEmail, 'test@example.com');

      // Check for SnackBar
      expect(find.text('Thank you for subscribing!'), findsOneWidget);
    });
  });
}