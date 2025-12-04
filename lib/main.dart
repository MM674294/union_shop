import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/clothing_page.dart';
import 'package:union_shop/merchandise_page.dart';
import 'package:union_shop/halloween_bags_page.dart';
import 'package:union_shop/signature_essential_page.dart';
import 'package:union_shop/print_shack_info_page.dart';
import 'package:union_shop/print_shack_personalise_page.dart';
import 'package:union_shop/graduation_page.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/login_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/checkout_page.dart';
import 'package:union_shop/home_screen.dart';

void main() {
  runApp(const UnionShopApp());
}

List<Map<String, dynamic>> cartItems = [];

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/sale': (context) => const SalePage(),
        '/clothing': (context) => const ClothingPage(),
        '/merchandise': (context) => const MerchandisePage(),
        '/halloween': (context) => const HalloweenBagsPage(),
        '/signature': (context) => const SignatureEssentialPage(),
        '/printshack': (context) => const PlaceholderPage(title: 'Print Shack'),
        '/printshackinfo': (context) => const PrintShackInfoPage(),
        '/printshackpersonalise': (context) => const PrintShackPersonalisePage(),
        '/graduation': (context) => const GraduationPage(),
        '/cart': (context) => const CartPage(),
        '/login': (context) => const LoginPage(),
        '/collections': (context) => const CollectionsPage(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}