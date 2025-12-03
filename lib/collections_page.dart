import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

List<Map<String, dynamic>> cartItems = [];

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  final List<Map<String, dynamic>> collections = [
    {
      'title': 'Autumn Favourites',
      'imageUrl': 'assets/images/clothing1.png',
      'products': [
        {'name': 'Autumn Hoodie', 'price': '£25.00', 'image': 'assets/images/clothing1.png'},
        {'name': 'Autumn Sweatshirt', 'price': '£20.00', 'image': 'assets/images/clothing2.png'},
        {'name': 'Autumn T-Shirt', 'price': '£15.00', 'image': 'assets/images/clothing3.png'},
      ],
    },
    {
      'title': 'Black Friday',
      'imageUrl': 'assets/images/m21.png',
      'products': [
        {'name': ' Hoodie', 'price': '£12.99', 'image': 'assets/images/clothing8.png'},
        {'name': 'Sweatshirt', 'price': '£10.99', 'image': 'assets/images/clothing4.png'},
        {'name': 'T-shirt', 'price': '£6.99', 'image': 'assets/images/clothing12.png'},
      ],
    },
    {
      'title': 'Clothing',
      'imageUrl': 'assets/images/clothing5.png',
      'products': [
        {'name': 'Classic Hoodie', 'price': '£25.00', 'image': 'assets/images/clothing1.png'},
        {'name': 'Classic Sweatshirt', 'price': '£23.00', 'image': 'assets/images/clothing2.png'},
        {'name': 'Classic T-Shirt', 'price': '£11.00', 'image': 'assets/images/clothing3.png'},
      ],
    },
    {
      'title': 'Clothing - Original',
      'imageUrl': 'assets/images/clothing10.png',
      'products': [
        {'name': 'Original Hoodie', 'price': '£30.00', 'image': 'assets/images/clothing10.png'},
        {'name': 'Original Sweatshirt', 'price': '£28.00', 'image': 'assets/images/clothing2.png'},
        {'name': 'Original Cap', 'price': '£12.00', 'image': 'assets/images/clothing7.png'},
      ],
    },
    {
      'title': 'Elections Discounts',
      'imageUrl': 'assets/images/clothing10.png',
      'products': [
        {'name': 'Election Hoodie', 'price': '£15.99', 'image': 'assets/images/clothing10.png'},
        {'name': 'Election Tee', 'price': '£8.99', 'image': 'assets/images/clothing3.png'},
      ],
    },
    {
      'title': 'Essential Range',
      'imageUrl': 'assets/images/clothing12.png',
      'products': [
        {'name': 'Essential T-Shirt', 'price': '£6.99', 'image': 'assets/images/clothing12.png'},
        {'name': 'Essential Hoodie', 'price': '£18.99', 'image': 'assets/images/clothing1.png'},
      ],
    },
    {
      'title': 'Graduation',
      'imageUrl': 'assets/images/clothing5.png',
      'products': [
        {'name': 'Graduation Hoodie', 'price': '£35.00', 'image': 'assets/images/clothing5.png'},
        {'name': 'Graduation Zip Sweatshirt', 'price': '£45.00', 'image': 'assets/images/clothing6.png'},
      ],
    },
    {
      'title': 'Limited Edition Essential Zip Hoodies',
      'imageUrl': 'assets/images/clothing13.png',
      'products': [
        {'name': 'Limited Edition Zip Hoodie Black', 'price': '£20.00', 'image': 'assets/images/clothing13.png'},
        {'name': 'Limited Edition Zip Hoodie Purple', 'price': '£20.00', 'image': 'assets/images/clothing1.png'},
      ],
    },
    {
      'title': 'Merchandise',
      'imageUrl': 'assets/images/m17.png',
      'products': [
        {'name': 'Magnet', 'price': '£10.00', 'image': 'assets/images/m17.png'},
        {'name': 'Badge', 'price': '£5.00', 'image': 'assets/images/m1.png'},
        {'name': 'Sticker Pack', 'price': '£3.00', 'image': 'assets/images/m3.png'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner at the top
        CustomAppBar.getBanner(),
        // Scaffold with navigation bar and body
        Expanded(
          child: Scaffold(
            appBar: CustomAppBar(parentContext: context),
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Page Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    color: Colors.grey[200],
                    child: const Text(
                      'Collections',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Collections Grid
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: collections.length,
                      itemBuilder: (context, index) {
                        final collection = collections[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CollectionDetailPage(
                                  collectionTitle: collection['title'],
                                  products: collection['products'],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            child: Stack(
                              children: [
                                // Image
                                Image.asset(
                                  collection['imageUrl'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                                // Dark overlay
                                Container(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                // Title overlay
                                Center(
                                  child: Text(
                                    collection['title'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Footer
                  Footer(
                    onEmailSubmitted: (email) {
                      debugPrint('User subscribed with email: $email');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CollectionDetailPage extends StatefulWidget {
  final String collectionTitle;
  final List<Map<String, dynamic>> products;

  const CollectionDetailPage({
    super.key,
    required this.collectionTitle,
    required this.products,
  });

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner at the top
        CustomAppBar.getBanner(),
        // Scaffold with navigation bar and body
        Expanded(
          child: Scaffold(
            appBar: CustomAppBar(parentContext: context),
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Page Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    color: Colors.grey[200],
                    child: Text(
                      widget.collectionTitle,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Products Grid
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: widget.products.length,
                      itemBuilder: (context, index) {
                        final product = widget.products[index];
                        return Card(
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  product['image'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
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
                                      product['name'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product['price'],
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          cartItems.add({
                                            'title': product['name'],
                                            'price': product['price'],
                                            'image': product['image'],
                                            'details': '',
                                          });
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Added to cart!'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF4d2963),
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                      ),
                                      child: const Text(
                                        'Add to Cart',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Footer
                  Footer(
                    onEmailSubmitted: (email) {
                      debugPrint('User subscribed with email: $email');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}