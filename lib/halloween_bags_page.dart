import 'package:flutter/material.dart';

// --- Cart Items (shared cart state) ---
List<Map<String, dynamic>> cartItems = [];

// --- All searchable items (clothing + merchandise + halloween) ---
final List<Map<String, String>> _allSearchableItems = [
  // --- Clothing items ---
  {
    'title': 'Classic Hoodies',
    'price': '£25.00',
    'imageUrl': 'assets/images/clothing1.png',
    'date': DateTime(2024, 1, 1).toIso8601String(),
  },
  {
    'title': 'Classic sweatshirts',
    'price': '£23.00',
    'imageUrl': 'assets/images/clothing2.png',
    'date': DateTime(2024, 1, 2).toIso8601String(),
  },
  {
    'title': 'Classic T-Shirts',
    'price': '£11.00',
    'imageUrl': 'assets/images/clothing3.png',
    'date': DateTime(2024, 1, 3).toIso8601String(),
  },
  {
    'title': 'Classic Sweatshirts - neutral',
    'price': '£ 1̶7̶.̶0̶0̶  £10.99',
    'imageUrl': 'assets/images/clothing4.png',
    'date': DateTime(2024, 1, 3).toIso8601String(),
  },
  {
    'title': 'Graduation Hoodies',
    'price': '£35.00',
    'imageUrl': 'assets/images/clothing5.png',
    'date': DateTime(2024, 1, 20).toIso8601String(),
  },
  {
    'title': 'Graduation 3/4 Zipped Sweatshirt',
    'price': '£45.00',
    'imageUrl': 'assets/images/clothing6.png',
    'date': DateTime(2024, 2, 20).toIso8601String(),
  },
  {
    'title': 'Classic Cap',
    'price': '£12.00',
    'imageUrl': 'assets/images/clothing7.png',
    'date': DateTime(2024, 3, 20).toIso8601String(),
  },
  {
    'title': 'Classic limited edition Hoodie',
    'price': '£3̶0̶.̶0̶0̶  £12.99',
    'imageUrl': 'assets/images/clothing8.png',
    'date': DateTime(2024, 1, 14).toIso8601String(),
  },
  {
    'title': 'Heavyweight Shorts',
    'price': '£3̶0̶.̶0̶0̶  £12.99',
    'imageUrl': 'assets/images/clothing9.png',
    'date': DateTime(2024, 5, 17).toIso8601String(),
  },
  {
    'title': 'Signiture Hoodie',
    'price': '£3̶0̶.̶0̶0̶  £12.99',
    'imageUrl': 'assets/images/clothing10.png',
    'date': DateTime(2024, 2, 2).toIso8601String(),
  },
  {
    'title': 'Ladies athletic Leggings',
    'price': '£ ̶2̶6̶.̶0̶0̶  £12.99',
    'imageUrl': 'assets/images/clothing11.png',
    'date': DateTime(2024, 7, 6).toIso8601String(),
  },
  {
    'title': 'Essential T-Shirt',
    'price': '£ ̶ ̶1̶0̶.̶9̶9̶  £6.99',
    'imageUrl': 'assets/images/clothing12.png',
    'date': DateTime(2024, 12, 20).toIso8601String(),
  },
  {
    'title': 'Limmited Edition Essential Zip Hoodies',
    'price': '£2̶0̶.̶0̶0̶  £6.99',
    'imageUrl': 'assets/images/clothing13.png',
    'date': DateTime(2024, 11, 20).toIso8601String(),
  },
  {
    'title': 'Waterproof poncho',
    'price': '£1.99',
    'imageUrl': 'assets/images/clothing14.png',
    'date': DateTime(2024, 6, 12).toIso8601String(),
  },
  {
    'title': 'Classic Burgendy Hoodie',
    'price': '̶£2̶5̶.̶0̶0̶  £12.00',
    'imageUrl': 'assets/images/clothing15.png',
    'date': DateTime(2024, 4, 3).toIso8601String(),
  },
  {
    'title': 'Signature T-Shirt',
    'price': '̶£2̶5̶.̶0̶0̶  £12.00',
    'imageUrl': 'assets/images/clothing16.png',
    'date': DateTime(2024, 3, 26).toIso8601String(),
  },
  {
    'title': 'Limited Edition UoM Beanies',
    'price': '̶£7.50',
    'imageUrl': 'assets/images/clothing17.png',
    'date': DateTime(2024, 9, 8).toIso8601String(),
  },
  // --- Merchandise items ---
  {
    'title': 'ID Holder',
    'price': '£0.75',
    'imageUrl': 'assets/images/m1.png',
    'date': DateTime(2024, 2, 1).toIso8601String(),
  },
  {
    'title': 'Lanyards',
    'price': '£2.75',
    'imageUrl': 'assets/images/m2.png',
    'date': DateTime(2024, 2, 2).toIso8601String(),
  },
  {
    'title': 'Graduation bears',
    'price': 'sold out',
    'imageUrl': 'assets/images/m3.png',
    'date': DateTime(2024, 3, 5).toIso8601String(),
  },
  {
    'title': 'UoP cotton shopper',
    'price': '£1.99',
    'imageUrl': 'assets/images/m4.png',
    'date': DateTime(2024, 2, 12).toIso8601String(),
  },
  {
    'title': 'Pen',
    'price': '£1.00',
    'imageUrl': 'assets/images/m5.png',
    'date': DateTime(2024, 2, 16).toIso8601String(),
  },
  {
    'title': 'limited edition Lanyard',
    'price': '£2.75',
    'imageUrl': 'assets/images/m6.png',
    'date': DateTime(2024, 2, 23).toIso8601String(),
  },
  {
    'title': 'Lapel Pin',
    'price': '£4.00',
    'imageUrl': 'assets/images/m7.png',
    'date': DateTime(2024, 3, 1).toIso8601String(),
  },
  {
    'title': 'Crested Tie',
    'price': '£̶1̶5̶.̶0̶0̶  £10.99',
    'imageUrl': 'assets/images/m8.png',
    'date': DateTime(2024, 3, 3).toIso8601String(),
  },
  {
    'title': 'Crested bag',
    'price': '£̶7̶.̶0̶0̶  £4.99',
    'imageUrl': 'assets/images/m9.png',
    'date': DateTime(2024, 3, 10).toIso8601String(),
  },
  {
    'title': 'Keep Cups',
    'price': '£6.50',
    'imageUrl': 'assets/images/m10.png',
    'date': DateTime(2024, 3, 15).toIso8601String(),
  },
  {
    'title': 'classic beanie hat',
    'price': '£6.50',
    'imageUrl': 'assets/images/clothing17.png',
    'date': DateTime(2024, 3, 28).toIso8601String(),
  },
  {
    'title': '8GB USBs',
    'price': '£̶7̶.̶5̶0̶  £5.50',
    'imageUrl': 'assets/images/m11.png',
    'date': DateTime(2024, 3, 24).toIso8601String(),
  },
  {
    'title': 'A5 Notepad',
    'price': 'Sold out',
    'imageUrl': 'assets/images/m12.png',
    'date': DateTime(2024, 4, 1).toIso8601String(),
  },
  {
    'title': 'Classic Cap',
    'price': '£12.00',
    'imageUrl': 'assets/images/clothing7.png',
    'date': DateTime(2024, 4, 3).toIso8601String(),
  },
  {
    'title': 'Crested Notebook',
    'price': '£ ̶1̶0̶.̶5̶0̶  £7.99',
    'imageUrl': 'assets/images/m13.png',
    'date': DateTime(2024, 4, 14).toIso8601String(),
  },
  {
    'title': 'Recycled Notebook',
    'price': '£1.80',
    'imageUrl': 'assets/images/m14.png',
    'date': DateTime(2024, 4, 16).toIso8601String(),
  },
  {
    'title': 'UoP Teddie bear',
    'price': 'Sold out',
    'imageUrl': 'assets/images/m15.png',
    'date': DateTime(2024, 4, 20).toIso8601String(),
  },
  {
    'title': 'Portsmouth City Postcard',
    'price': '£1.00',
    'imageUrl': 'assets/images/m16.png',
    'date': DateTime(2024, 4, 21).toIso8601String(),
  },
  {
    'title': 'Portsmouth City Magnet',
    'price': '£4.50',
    'imageUrl': 'assets/images/m17.png',
    'date': DateTime(2024, 4, 21).toIso8601String(),
  },
  {
    'title': 'Portsmouth City Bookmark',
    'price': '£3.00',
    'imageUrl': 'assets/images/m18.png',
    'date': DateTime(2024, 4, 27).toIso8601String(),
  },
  {
    'title': 'Type C charge and Synce Cable',
    'price': '£̶3̶.̶0̶0̶  £1.50',
    'imageUrl': 'assets/images/m19.png',
    'date': DateTime(2024, 4, 27).toIso8601String(),
  },
  {
    'title': 'USB to USB charge and Synce Cables',
    'price': '£̶3̶.̶0̶0̶  £1.50',
    'imageUrl': 'assets/images/m20.png',
    'date': DateTime(2024, 4, 29).toIso8601String(),
  },
  {
    'title': 'Limited edition bracelet',
    'price': '£̶1.̶0̶0̶  £0.50',
    'imageUrl': 'assets/images/m21.png',
    'date': DateTime(2024, 5, 2).toIso8601String(),
  },
  {
    'title': 'waterproof Poncho',
    'price': '£1.99',
    'imageUrl': 'assets/images/clothing14.png',
    'date': DateTime(2024, 5, 9).toIso8601String(),
  },
  {
    'title': 'Portsmouth City Notebook',
    'price': '£7.50',
    'imageUrl': 'assets/images/m23.png',
    'date': DateTime(2024, 5, 9).toIso8601String(),
  },
  {
    'title': 'Portsmouth City Keyring',
    'price': '£6.75',
    'imageUrl': 'assets/images/m24.png',
    'date': DateTime(2024, 5, 11).toIso8601String(),
  },
  {
    'title': 'Portsmouth City Coaster',
    'price': '£4.50',
    'imageUrl': 'assets/images/m25.png',
    'date': DateTime(2024, 5, 12).toIso8601String(),
  },
  {
    'title': 'Portsmouth City water bottle',
    'price': '£2.50',
    'imageUrl': 'assets/images/m26.png',
    'date': DateTime(2024, 5, 15).toIso8601String(),
  },
  {
    'title': 'Halloween Tote Bag',
    'price': '£2.50',
    'imageUrl': 'assets/images/m27.png',
    'date': DateTime(2024, 5, 15).toIso8601String(),
  },
];

// --- Search Delegate ---
class HalloweenSearchDelegate extends SearchDelegate<Map<String, String>?> {
  final List<Map<String, String>> items;
  HalloweenSearchDelegate(this.items);

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

    return ListView(
      children: [
        if (results.isEmpty)
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(child: Text('No results found.')),
          )
        else
          ...results.map((item) => ListTile(
                leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
                title: Text(item['title']!),
                subtitle: Text(item['price']!),
                onTap: () {
                  // You can add navigation logic here if needed
                },
              )),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = items
        .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: [
        ...suggestions.map((item) => ListTile(
              leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
              title: Text(item['title']!),
              subtitle: Text(item['price']!),
              onTap: () {
                // You can add navigation logic here if needed
              },
            )),
      ],
    );
  }
}

// --- AppBar Widget ---
class _HalloweenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearch;
  const _HalloweenAppBar({required this.onSearch});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
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
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
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
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sale');
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
          const SizedBox(width: 12),
          DropdownButton<String>(
            underline: Container(),
            icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4d2963)),
            isDense: true,
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
                value: '/halloween',
                child: const Text('Halloween'),
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
                Navigator.pushNamed(context, value);
              }
            },
            hint: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Shop',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4d2963),
                  ),
                ),
                SizedBox(width: 2),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                onPressed: onSearch,
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
            ],
          ),
        ],
      ),
    );
  }
}

// --- Footer Widget ---
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              SizedBox(width: 16),
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
              SizedBox(width: 16),
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
    );
  }
}

// --- Cart Page (minimal) ---
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
                  subtitle: Text('Qty: ${item['quantity'] ?? 1}'),
                  trailing: Text(item['price']!),
                );
              },
            ),
    );
  }
}

// --- Halloween Bags Page (with search and space for your content) ---
class HalloweenBagsPage extends StatelessWidget {
  const HalloweenBagsPage({super.key});

  void _showSearch(BuildContext context) {
    showSearch<Map<String, String>?>(
      context: context,
      delegate: HalloweenSearchDelegate(_allSearchableItems),
    );
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: _HalloweenAppBar(
      onSearch: () => _showSearch(context),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Halloween',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4d2963),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: Main image and thumbnails
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          'assets/images/m27.png', // Main image
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/m27.png', width: 20, height: 20),
                          const SizedBox(width: 5),
                          Image.asset('assets/images/halloween2.png', width: 20, height: 20),
                          const SizedBox(width: 5),
                          Image.asset('assets/images/halloween3.png', width: 20, height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                // Right: Title, dropdown, quantity, add to cart, and your text
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Halloween Tote Bags',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '£2.50',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      // Dropdown for design
                      DropdownButton<String>(
                        value: 'Boo!',
                        items: const [
                          DropdownMenuItem(value: 'Boo!', child: Text('Boo!')),
                          DropdownMenuItem(value: 'Pumpkin', child: Text('Pumpkin')),
                          DropdownMenuItem(value: 'Bat', child: Text('Bat')),
                        ],
                        onChanged: (val) {},
                      ),
                      const SizedBox(height: 8),
                      // Quantity selector
                      Row(
                        children: [
                          const Text('Quantity'),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              ),
                              keyboardType: TextInputType.number,
                              controller: TextEditingController(text: '1'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Add to cart button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('ADD TO CART'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Your custom text at the bottom
                      const Text(
                        'Trick or treat yourself to one of these limited edition Halloween tote bags!\n\n'
                        'Available to purchase in store & online for just £2.50!!!\n\n'
                        'Be quick ... before they do a disappearing act ...\n\n'
                        'Due to the hand crafted nature of this item, final product may differ slightly from original design.\n\n'
                        'Designs will be printed after purchase and be available up to two working days later.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _Footer(), // Footer is now at the end of the scrollable content
          ],
        ),
      ),
    ),
  );
}
}