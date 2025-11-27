import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/sale_page.dart';

void main() {
  runApp(const UnionShopApp());
}

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
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/sale': (context) => const SalePage(),
        '/shop1': (context) => const PlaceholderPage(title: 'Shop Page 1'),
        '/shop2': (context) => const PlaceholderPage(title: 'Shop Page 2'),
        '/shop3': (context) => const PlaceholderPage(title: 'Shop Page 3'),
        '/shop4': (context) => const PlaceholderPage(title: 'Shop Page 4'),
        '/shop5': (context) => const PlaceholderPage(title: 'Shop Page 5'),
        '/shop6': (context) => const PlaceholderPage(title: 'Shop Page 6'),
        '/shop7': (context) => const PlaceholderPage(title: 'Shop Page 7'),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Navigate to the HomeScreen
  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  // Navigate to the ProductPage
  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void navigateToSale(BuildContext context) {
    Navigator.pushNamed(context, '/sale'); // Navigate to SalePage
  }

  // Placeholder callback for buttons that are not implemented yet
  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner with promotional text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header with navigation buttons
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          // Logo that navigates to the HomeScreen
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),

                          const Spacer(),

                          // Home Button
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                            },
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4d2963),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),

                          const SizedBox(width: 16), // Space between buttons

                          // About Button
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/about'); // Navigate to the About page
                            },
                            child: const Text(
                              'About',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4d2963),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),

                          const SizedBox(width: 16), // Space between buttons

                          // Sale Button
                          TextButton(
                            onPressed: () {
                              navigateToSale(context); // Navigate to the Sale page
                            },
                            child: const Text(
                              'Sale',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4d2963),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),

                          const SizedBox(width: 16), // Space between buttons

                          // Shop Dropdown Button
                          DropdownButton<String>(
                            underline: Container(), // Remove underline
                            items: [
                              DropdownMenuItem(
                                value: '/shop1',
                                child: const Text('Shop Page 1'),
                              ),
                              DropdownMenuItem(
                                value: '/shop2',
                                child: const Text('Shop Page 2'),
                              ),
                              DropdownMenuItem(
                                value: '/shop3',
                                child: const Text('Shop Page 3'),
                              ),
                              DropdownMenuItem(
                                value: '/shop4',
                                child: const Text('Shop Page 4'),
                              ),
                              DropdownMenuItem(
                                value: '/shop5',
                                child: const Text('Shop Page 5'),
                              ),
                              DropdownMenuItem(
                                value: '/shop6',
                                child: const Text('Shop Page 6'),
                              ),
                              DropdownMenuItem(
                                value: '/shop7',
                                child: const Text('Shop Page 7'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                Navigator.pushNamed(context, value);
                              }
                            },
                            hint: const Text(
                              'Shop',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4d2963),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),

                          const Spacer(),

                          // Icons Section
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Other content (e.g., Hero Section, Products Section, Footer) remains unchanged
          ],
        ),
      ),
    );
  }
}

// Placeholder page for the shop pages
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