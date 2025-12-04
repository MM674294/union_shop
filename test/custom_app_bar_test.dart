import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/custom_app_bar.dart';


void main() {
  group('ResponsiveBanner Tests', () {
    testWidgets('ResponsiveBanner displays text', (WidgetTester tester) async {
      const bannerText = 'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE!';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveBanner(text: bannerText),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(bannerText), findsOneWidget);
    });

    testWidgets('ResponsiveBanner has container', (WidgetTester tester) async {
      const bannerText = 'Test Banner';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveBanner(text: bannerText),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('ResponsiveBanner text is displayed', (WidgetTester tester) async {
      const bannerText = 'Test Banner';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveBanner(text: bannerText),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(bannerText), findsOneWidget);
    });

    testWidgets('ResponsiveBanner is responsive on mobile', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      const bannerText = 'BIG SALE!';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveBanner(text: bannerText),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(bannerText), findsOneWidget);
    });

    testWidgets('ResponsiveBanner is responsive on desktop', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 800);

      const bannerText = 'BIG SALE!';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveBanner(text: bannerText),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(bannerText), findsOneWidget);
    });

    testWidgets('ResponsiveBanner text is centered', (WidgetTester tester) async {
      const bannerText = 'Test Banner';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveBanner(text: bannerText),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(bannerText), findsOneWidget);
    });

    testWidgets('ResponsiveBanner renders', (WidgetTester tester) async {
      const bannerText = 'Test Banner';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveBanner(text: bannerText),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ResponsiveBanner), findsOneWidget);
    });
  });

  group('allProducts Tests', () {
    test('allProducts list contains items', () {
      expect(allProducts, isNotEmpty);
    });

    test('allProducts contains signature products', () {
      final signatureProducts = allProducts
          .where((p) => p['title']!.contains('Signature'))
          .toList();
      expect(signatureProducts, isNotEmpty);
    });

    test('allProducts contains clothing items', () {
      final clothingItems = allProducts
          .where((p) => p['title']!.contains('Hoodie') ||
              p['title']!.contains('T-Shirt'))
          .toList();
      expect(clothingItems, isNotEmpty);
    });

    test('allProducts contains merchandise items', () {
      final merchandiseItems = allProducts
          .where((p) => p['title']!.contains('Lanyard') ||
              p['title']!.contains('Pen'))
          .toList();
      expect(merchandiseItems, isNotEmpty);
    });

    test('allProducts items have required fields', () {
      for (final product in allProducts) {
        expect(product.containsKey('title'), isTrue);
        expect(product.containsKey('price'), isTrue);
        expect(product.containsKey('imageUrl'), isTrue);
      }
    });

    test('allProducts items have non-empty title', () {
      for (final product in allProducts) {
        expect(product['title']!.isNotEmpty, isTrue);
      }
    });

    test('allProducts items have non-empty price', () {
      for (final product in allProducts) {
        expect(product['price']!.isNotEmpty, isTrue);
      }
    });

    test('allProducts items have non-empty imageUrl', () {
      for (final product in allProducts) {
        expect(product['imageUrl']!.isNotEmpty, isTrue);
      }
    });
  });
}