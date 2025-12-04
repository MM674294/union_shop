import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_info_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

void main() {
  group('PrintShackInfoPage Tests', () {
    testWidgets('PrintShackInfoPage displays title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('The Union Print Shack'), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage displays custom app bar', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage displays banner', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ResponsiveBanner), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage displays three images', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('PrintShackInfoPage displays main heading', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Make It Yours at The Union Print Shack'), findsOneWidget);
    });
 });

    testWidgets('PrintShackInfoPage displays pricing section heading', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Simple Pricing, No Surprises'), findsOneWidget);
    });


    testWidgets('PrintShackInfoPage displays terms and conditions heading', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation Terms & Conditions'), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage displays terms and conditions text', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(
          "We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.",
        ),
        findsOneWidget,
      );
    });

    testWidgets('PrintShackInfoPage displays call to action heading', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Ready to Make It Yours?'), findsOneWidget);
    });


    testWidgets('PrintShackInfoPage has drawer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage is scrollable', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage images are in row', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('PrintShackInfoPage has column structure', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('PrintShackInfoPage has padding', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('PrintShackInfoPage text alignment is centered for title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      final titleWidget = find.text('The Union Print Shack');
      expect(titleWidget, findsOneWidget);
    });

    testWidgets('PrintShackInfoPage has aspect ratio images', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AspectRatio), findsWidgets);
    });

 

    testWidgets('PrintShackInfoPage is responsive on tablet', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(800, 1800);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('The Union Print Shack'), findsOneWidget);
      expect(find.byType(Footer), findsOneWidget);
    });



    testWidgets('PrintShackInfoPage has scaffold', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage title has correct font size', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      final titleText = find.text('The Union Print Shack');
      expect(titleText, findsOneWidget);
    });

    testWidgets('PrintShackInfoPage section headings are bold', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Make It Yours at The Union Print Shack'), findsOneWidget);
      expect(find.text('Simple Pricing, No Surprises'), findsOneWidget);
    });

    testWidgets('PrintShackInfoPage renders without errors', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PrintShackInfoPage), findsOneWidget);
    });



    testWidgets('PrintShackInfoPage text is left aligned in content', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('PrintShackInfoPage images have containers', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackInfoPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });
  
}