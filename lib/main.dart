import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/clothing_page.dart';
import 'package:union_shop/merchandise_page.dart';
import 'package:union_shop/halloween_bags_page.dart';
import 'package:union_shop/signature_essential_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

// Add this import if you have a PrintShackPage
// import 'package:union_shop/print_shack_page.dart';

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
        '/clothing': (context) => const ClothingPage(),
        '/merchandise': (context) => const MerchandisePage(),
        '/halloween': (context) => const HalloweenBagsPage(),
        '/signature': (context) => const SignatureEssentialPage(),
        '/printshack': (context) => const PlaceholderPage(title: 'Print Shack'), // Replace with PrintShackPage when ready
        '/page5': (context) => const PlaceholderPage(title: 'Page 5'),
        '/page6': (context) => const PlaceholderPage(title: 'Page 6'),
        '/page7': (context) => const PlaceholderPage(title: 'Page 7'),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isPaused = false;
  late final List<_HeroSlide> _slides;
  late final PageController _dotsController;

  @override
  void initState() {
    super.initState();
    _dotsController = PageController();
    _slides = [
      _HeroSlide(
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/yournamehere_1024x1024.jpg?v=1752232561',
        title: "The Print Shack",
        subtitle: "Let’s create something uniquely you with our personalisation service — From £3 for one line of text!",
        buttonText: "FIND OUT MORE",
        onPressed: (context) => Navigator.pushNamed(context, '/printshack'),
      ),
      _HeroSlide(
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
        title: "Browse our Clothing",
        subtitle: "Shop the latest styles",
        buttonText: "BROWSE CLOTHING",
        onPressed: (context) => Navigator.pushNamed(context, '/clothing'),
      ),
      _HeroSlide(
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        title: "Shop Merchandise",
        subtitle: "Find unique gifts and more",
        buttonText: "BROWSE MERCHANDISE",
        onPressed: (context) => Navigator.pushNamed(context, '/merchandise'),
      ),
      _HeroSlide(
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
        title: "Check Out Our Sale",
        subtitle: "Grab a bargain before it's gone!",
        buttonText: "VIEW SALE",
        onPressed: (context) => Navigator.pushNamed(context, '/sale'),
      ),
    ];
    _startAutoSlide();
  }

  void _startAutoSlide() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 4));
      if (!_isPaused) {
        setState(() {
          _currentPage = (_currentPage + 1) % _slides.length;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Carousel
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _slides.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      final slide = _slides[index];
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            slide.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                              child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                            ),
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.6),
                          ),
                          Positioned(
                            left: 24,
                            right: 24,
                            top: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  slide.title,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  slide.subtitle,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 32),
                                ElevatedButton(
                                  onPressed: () => slide.onPressed(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4d2963),
                                    foregroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    slide.buttonText,
                                    style: const TextStyle(fontSize: 14, letterSpacing: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // Carousel controls
                  Positioned(
                    left: 8,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.white, size: 32),
                      onPressed: () {
                        setState(() {
                          _isPaused = true;
                          _currentPage = (_currentPage - 1 + _slides.length) % _slides.length;
                          _pageController.animateToPage(
                            _currentPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_right, color: Colors.white, size: 32),
                      onPressed: () {
                        setState(() {
                          _isPaused = true;
                          _currentPage = (_currentPage + 1) % _slides.length;
                          _pageController.animateToPage(
                            _currentPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                    ),
                  ),
                  // Dots and pause/play
                  Positioned(
                    bottom: 24,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(_slides.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentPage = index;
                                _pageController.animateToPage(
                                  _currentPage,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: Icon(
                            _isPaused ? Icons.play_arrow : Icons.pause,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPaused = !_isPaused;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PRODUCTS SECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Portsmouth City Magnet',
                          price: '£10.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portsmouth signature magnet',
                          price: '£15.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portmouth Limited Edition Magnet',
                          price: '£20.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portmouth UoM Magnet',
                          price: '£25.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer Section
            Footer(
              onEmailSubmitted: (email) {
                print('User subscribed with email: $email');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroSlide {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final void Function(BuildContext) onPressed;

  _HeroSlide({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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