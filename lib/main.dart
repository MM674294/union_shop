import 'package:flutter/material.dart';

// Dummy cart state for demonstration
List<Map<String, dynamic>> cartItems = [];

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  String _selectedFilter = 'All Products';
  String _selectedSort = 'Featured';
  int _currentPage = 1;
  String _searchQuery = '';

  final List<Map<String, String>> _clothingItems = [
    {
      'title': 'Classic Hoodies',
      'price': '£25.00',
      'imageUrl': 'assets/images/clothing1.png',
      'date': DateTime(2024, 1, 1).toIso8601String(),
    },
    // ...add the rest of your clothing items here...
  ];

  double _parsePrice(String price) {
    final matches = RegExp(r'£([\d.]+)').allMatches(price);
    if (matches.isNotEmpty) {
      return double.tryParse(matches.last.group(1)!) ?? 0.0;
    }
    return 0.0;
  }

  DateTime _parseDate(String date) =>
      DateTime.tryParse(date) ?? DateTime(2000);

  List<Map<String, String>> _sortClothingItems(List<Map<String, String>> items) {
    List<Map<String, String>> sorted = List<Map<String, String>>.from(items);
    switch (_selectedSort) {
      case 'Featured':
        return sorted;
      case 'A-Z':
        sorted.sort((a, b) => a['title']!.compareTo(b['title']!));
        return sorted;
      case 'Z-A':
        sorted.sort((a, b) => b['title']!.compareTo(a['title']!));
        return sorted;
      case 'Price High to Low':
        sorted.sort((a, b) => _parsePrice(b['price']!).compareTo(_parsePrice(a['price']!)));
        return sorted;
      case 'Price Low to High':
        sorted.sort((a, b) => _parsePrice(a['price']!).compareTo(_parsePrice(b['price']!)));
        return sorted;
      case 'Date Old to New':
        sorted.sort((a, b) => _parseDate(a['date']!).compareTo(_parseDate(b['date']!)));
        return sorted;
      case 'Date New to Old':
        sorted.sort((a, b) => _parseDate(b['date']!).compareTo(_parseDate(a['date']!)));
        return sorted;
      default:
        return sorted;
    }
  }

  List<Map<String, String>> get _filteredClothingItems {
    final sorted = _sortClothingItems(_clothingItems);
    final filtered = sorted.where((item) {
      if (_searchQuery.isEmpty) return true;
      return item['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    final start = (_currentPage - 1) * 10;
    final end = (_currentPage * 10).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  int get _totalPages {
    final filtered = _clothingItems.where((item) {
      if (_searchQuery.isEmpty) return true;
      return item['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    return (filtered.length / 10).ceil();
  }

  void _showSearch(BuildContext context) async {
    final result = await showSearch<Map<String, String>?>(
      context: context,
      delegate: ClothingSearchDelegate(_clothingItems),
    );
    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ItemDetailPage(item: result),
        ),
      );
    }
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Logo
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
            const SizedBox(width: 16),
            // About Button
            TextButton(
              onPressed: () {
                _navigateTo(context, '/about');
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
            const SizedBox(width: 16),
            // Sale Button
            TextButton(
              onPressed: () {
                _navigateTo(context, '/sale');
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
            const SizedBox(width: 16),
            // Dropdown Button
            DropdownButton<String>(
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4d2963)),
              items: [
                DropdownMenuItem(
                  value: '/clothing',
                  child: const Text('Clothing'),
                ),
                DropdownMenuItem(
                  value: '/merchandise',
                  child: const Text('Merchandise'),
                ),
                DropdownMenuItem(
                  value: '/page3',
                  child: const Text('Page 3'),
                ),
                DropdownMenuItem(
                  value: '/page4',
                  child: const Text('Page 4'),
                ),
                DropdownMenuItem(
                  value: '/page5',
                  child: const Text('Page 5'),
                ),
                DropdownMenuItem(
                  value: '/page6',
                  child: const Text('Page 6'),
                ),
                DropdownMenuItem(
                  value: '/page7',
                  child: const Text('Page 7'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  _navigateTo(context, value);
                }
              },
              hint: const Text(
                'Shop',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4d2963),
                ),
              ),
            ),
            const Spacer(),
            // Icons Section
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                  onPressed: () => _showSearch(context),
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey),
                  onPressed: () {
                    // TODO: Navigate to profile page
                  },
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CartPage()),
                        );
                      },
                    ),
                    if (cartItems.isNotEmpty)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${cartItems.length}',
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.menu, size: 18, color: Colors.grey),
                  onPressed: () {
                    // TODO: Open menu drawer or similar
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sale Banner
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
            // Page Title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: const Text(
                'Clothing',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Filter & Sort Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    'Filter by:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedFilter,
                    items: const [
                      DropdownMenuItem(
                        value: 'All Products',
                        child: Text('All Products'),
                      ),
                      DropdownMenuItem(
                        value: 'Clothing',
                        child: Text('Clothing'),
                      ),
                      DropdownMenuItem(
                        value: 'Merchandise',
                        child: Text('Merchandise'),
                      ),
                      DropdownMenuItem(
                        value: 'Popular',
                        child: Text('Popular'),
                      ),
                      DropdownMenuItem(
                        value: 'PSUT',
                        child: Text('PSUT'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedFilter = value!;
                        _currentPage = 1;
                      });
                    },
                  ),
                  const SizedBox(width: 24),
                  const Text(
                    'Sort by:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedSort,
                    items: const [
                      DropdownMenuItem(
                        value: 'Featured',
                        child: Text('Featured'),
                      ),
                      DropdownMenuItem(
                        value: 'Best Selling',
                        child: Text('Best Selling'),
                      ),
                      DropdownMenuItem(
                        value: 'A-Z',
                        child: Text('A-Z'),
                      ),
                      DropdownMenuItem(
                        value: 'Z-A',
                        child: Text('Z-A'),
                      ),
                      DropdownMenuItem(
                        value: 'Price High to Low',
                        child: Text('Price High to Low'),
                      ),
                      DropdownMenuItem(
                        value: 'Price Low to High',
                        child: Text('Price Low to High'),
                      ),
                      DropdownMenuItem(
                        value: 'Date Old to New',
                        child: Text('Date Old to New'),
                      ),
                      DropdownMenuItem(
                        value: 'Date New to Old',
                        child: Text('Date New to Old'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedSort = value!;
                        _currentPage = 1;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${_clothingItems.length} products',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Clothing Grid Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: _filteredClothingItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredClothingItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ItemDetailPage(item: item),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              item['imageUrl']!,
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
                            child: Text(
                              item['title']!,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item['price']!,
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Pagination Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _currentPage > 1
                      ? () {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      : null,
                  child: const Text('Previous'),
                ),
                Text('Page $_currentPage of $_totalPages'),
                TextButton(
                  onPressed: _currentPage < _totalPages
                      ? () {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
            // Footer Section
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: const [
                            Text(
                              'Opening Hours',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '❄️ Winter Break Closure Dates ❄️\nClosing 4pm 19/12/2025\nReopening 9am 06/01/2026',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '---------------------------------',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '(Term Time)\nMonday - Friday 10am - 4pm\n(Outside of Term Time / Consolidation Weeks)\nMonday - Friday 10am - 3pm\nPurchase online 24/7',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          children: const [
                            Text(
                              'Help and Information',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Search\nTerms & Conditions of Sale Policy',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          children: [
                            const Text(
                              'Latest Offers',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email Address',
                                hintText: 'Enter your email',
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: null, // Replace with your logic if needed
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Subscribe'),
                            ),
                          ],
                        ),
                      ),
                    ],
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

// --- Search Delegate ---
class ClothingSearchDelegate extends SearchDelegate<Map<String, String>?> {
  final List<Map<String, String>> items;
  ClothingSearchDelegate(this.items);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    final results = items
        .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (results.isEmpty) {
      return const Center(child: Text('No results found.'));
    }
    return ListView(
      children: results
          .map((item) => ListTile(
                leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
                title: Text(item['title']!),
                subtitle: Text(item['price']!),
                onTap: () => close(context, item),
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = items
        .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView(
      children: suggestions
          .map((item) => ListTile(
                leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
                title: Text(item['title']!),
                subtitle: Text(item['price']!),
                onTap: () => close(context, item),
              ))
          .toList(),
    );
  }
}

// --- Item Detail Page ---
class ItemDetailPage extends StatefulWidget {
  final Map<String, String> item;
  const ItemDetailPage({super.key, required this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int quantity = 1;
  String selectedSize = 'M';
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['title'] ?? ''),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              widget.item['imageUrl']!,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  height: 200,
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              widget.item['title']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.item['price']!,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Size:'),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedSize,
                  items: sizes
                      .map((size) => DropdownMenuItem(
                            value: size,
                            child: Text(size),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSize = value!;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text('Quantity:'),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: quantity > 1
                      ? () => setState(() => quantity--)
                      : null,
                ),
                Text('$quantity'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => quantity++),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                cartItems.add({
                  ...widget.item,
                  'quantity': quantity.toString(),
                  'size': selectedSize,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --- Cart Page (basic example) ---
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF4d2963),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
                  title: Text(item['title']!),
                  subtitle: Text('Size: ${item['size']}, Qty: ${item['quantity']}'),
                  trailing: Text(item['price']!),
                );
              },
            ),
    );
  }
}