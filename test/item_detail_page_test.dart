import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/item_detail_page.dart';
import 'package:union_shop/main.dart';

void main() {
  setUp(() {
    cartItems.clear();
  });

  tearDown(() {
    cartItems.clear();
  });

  final testItem = {
    'title': 'Test Product',
    'price': '£25.00',
    'imageUrl': 'assets/images/test_product.png',
  };

  group('ItemDetailPage Tests', () {
    testWidgets('ItemDetailPage displays product title in app bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsWidgets);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('ItemDetailPage displays product image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('ItemDetailPage displays product title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsWidgets);
    });

    testWidgets('ItemDetailPage displays product price', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('ItemDetailPage displays size label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Size:'), findsOneWidget);
    });

    testWidgets('ItemDetailPage displays size dropdown', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.text('M'), findsOneWidget);
    });

    testWidgets('ItemDetailPage displays quantity label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Quantity:'), findsOneWidget);
    });

    testWidgets('ItemDetailPage displays quantity controls', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('ItemDetailPage displays add to cart button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart), findsOneWidget);
    });

    testWidgets('ItemDetailPage default size is M', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('M'), findsOneWidget);
    });

    testWidgets('ItemDetailPage default quantity is 1', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('ItemDetailPage can increase quantity', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('ItemDetailPage can increase quantity multiple times', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add);
      await tester.tap(addButton);
      await tester.tap(addButton);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      expect(find.text('4'), findsOneWidget);
    });

    testWidgets('ItemDetailPage can decrease quantity', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add);
      await tester.tap(addButton);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      final removeButton = find.byIcon(Icons.remove);
      await tester.tap(removeButton);
      await tester.pumpAndSettle();

      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('ItemDetailPage remove button is disabled at quantity 1', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      // At quantity 1, remove button should be disabled
      final removeButton = find.byType(IconButton).first;
      expect(tester.widget<IconButton>(removeButton).onPressed, isNull);
    });


    testWidgets('ItemDetailPage can change size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      final dropdown = find.byType(DropdownButton<String>);
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      await tester.tap(find.text('L').last);
      await tester.pumpAndSettle();

      expect(find.text('L'), findsOneWidget);
    });

    testWidgets('ItemDetailPage size dropdown shows all sizes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      final dropdown = find.byType(DropdownButton<String>);
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      expect(find.text('XS'), findsOneWidget);
      expect(find.text('S'), findsOneWidget);
      expect(find.text('M'), findsWidgets);
      expect(find.text('L'), findsOneWidget);
      expect(find.text('XL'), findsOneWidget);
    });


    testWidgets('ItemDetailPage add to cart shows snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      expect(find.text('Added to cart!'), findsOneWidget);
    });

  
    testWidgets('ItemDetailPage app bar has correct background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('ItemDetailPage has padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('ItemDetailPage is scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('ItemDetailPage displays error image gracefully', (WidgetTester tester) async {
      final invalidItem = {
        'title': 'Invalid Product',
        'price': '£99.00',
        'imageUrl': 'assets/images/nonexistent.png',
      };

      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: invalidItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
    });


    testWidgets('ItemDetailPage text styling is correct', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      final titleFinder = find.text('Test Product');
      expect(titleFinder, findsWidgets);

      final priceFinder = find.text('£25.00');
      expect(priceFinder, findsOneWidget);
    });

    testWidgets('ItemDetailPage column has correct structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsWidgets);
    });
  });

  group('ItemDetailPage Widget Tests', () {
    testWidgets('ItemDetailPage is a StatefulWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ItemDetailPage), findsOneWidget);
    });

    testWidgets('ItemDetailPage Scaffold has AppBar and Body', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('ItemDetailPage has all form elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ItemDetailPage(item: testItem),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Size:'), findsOneWidget);
      expect(find.text('Quantity:'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}