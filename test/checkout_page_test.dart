import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/checkout_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  

  group('CheckoutPage Tests', () {
    testWidgets('CheckoutPage displays title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Checkout'), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays contact section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Contact'), findsOneWidget);
        expect(find.text('Email'), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays delivery section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Delivery'), findsOneWidget);
        expect(find.text('Country/Region'), findsOneWidget);
        expect(find.text('First name'), findsOneWidget);
        expect(find.text('Last name'), findsOneWidget);
        expect(find.text('Address'), findsOneWidget);
        expect(find.text('City'), findsOneWidget);
        expect(find.text('Postal code'), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays delivery method section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Delivery Method'), findsOneWidget);
        expect(find.text('Ship (£5.99)'), findsOneWidget);
        expect(find.text('Pick up (Free)'), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays payment section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Payment'), findsOneWidget);
        expect(find.text('Card number'), findsOneWidget);
        expect(find.text('MM/YY'), findsOneWidget);
        expect(find.text('CVV'), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays order summary', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Order Summary'), findsOneWidget);
        expect(find.text('Subtotal:'), findsOneWidget);
        expect(find.text('Tax:'), findsOneWidget);
        expect(find.text('Shipping:'), findsOneWidget);
        expect(find.text('Total:'), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays pay now button', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('PAY NOW'), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(Footer), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage displays banner', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(CustomAppBar), findsOneWidget);
      });
    });

    testWidgets('CheckoutPage country dropdown exists', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        final dropdown = find.byType(DropdownButtonFormField<String>);
        expect(dropdown, findsWidgets);
      });
    });

    testWidgets('CheckoutPage delivery method options exist', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Ship (£5.99)'), findsOneWidget);
        expect(find.text('Pick up (Free)'), findsOneWidget);
      });
    });

    

    testWidgets('CheckoutPage displays all form inputs', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CheckoutPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(TextFormField), findsWidgets);
        expect(find.text('Email'), findsOneWidget);
        expect(find.text('First name'), findsOneWidget);
        expect(find.text('Last name'), findsOneWidget);
        expect(find.text('Address'), findsOneWidget);
        expect(find.text('City'), findsOneWidget);
        expect(find.text('Postal code'), findsOneWidget);
        expect(find.text('Card number'), findsOneWidget);
      });
    });
  });
}