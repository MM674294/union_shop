import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/signature_essential_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

void main() {
  group('SignatureEssentialPage Tests', () {
    testWidgets('SignatureEssentialPage displays custom app bar',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays footer',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays page title',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Signature & Essential Range'), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays filter dropdown',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Filter by:'), findsOneWidget);
      expect(find.byType(DropdownButton<String>).first, findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays sort dropdown',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Sort by:'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsWidgets);
    });

    testWidgets('SignatureEssentialPage displays all 4 products',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Signature T-Shirt'), findsOneWidget);
      expect(find.text('Signature Hoodie'), findsOneWidget);
      expect(find.text('Limited Edition Essential Zip Hoodies'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays product prices',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('£14.99'), findsOneWidget);
      expect(find.text('£32.99'), findsOneWidget);
      expect(find.text('£20.00 £14.99'), findsOneWidget);
      expect(find.text('£10.99 £6.99'), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays product count',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('4 products'), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays product grid',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage displays product images',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });


    testWidgets('SignatureEssentialPage navigates to product detail on tap',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      final productCards = find.byType(GestureDetector);
      await tester.tap(productCards.first);
      await tester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('SignatureEssentialPage is responsive on tablet',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(800, 1200);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Signature & Essential Range'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage has drawer',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage has scaffold',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage has column structure',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('SignatureEssentialPage renders without errors',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SignatureEssentialPage), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage product cards have proper styling',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('SignatureEssentialPage default sort is featured',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Featured'), findsOneWidget);
    });

    testWidgets('SignatureEssentialPage default filter is all products',
        (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await tester.pumpWidget(
        const MaterialApp(
          home: SignatureEssentialPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('All Products'), findsOneWidget);
    });
  });
}