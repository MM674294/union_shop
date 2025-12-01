import 'package:flutter/material.dart';

// --- Cart Items (shared cart state) ---
List<Map<String, dynamic>> cartItems = [];

// --- Signature & Essential Products Only ---
final List<Map<String, String>> signatureEssentialProducts = [
  {
    'title': 'Signature T-Shirt',
    'price': '£14.99',
    'imageUrl': 'assets/images/signature_tshirt.png',
  },
  {
    'title': 'Signature Hoodie',
    'price': '£32.99',
    'imageUrl': 'assets/images/signature_hoodie.png',
  },
  {
    'title': 'Limited Edition Essential Zip Hoodies',
    'price': '£20.00 £14.99',
    'imageUrl': 'assets/images/essential_zip_hoodie.png',
  },
  {
    'title': 'Essential T-Shirt',
    'price': '£10.99 £6.99',
    'imageUrl': 'assets/images/essential_tshirt.png',
  },
];

// --- All Products (Signature, Essential, Clothing, Merchandise, Halloween, etc.) ---
final List<Map<String, String>> allProducts = [
  // --- Signature & Essential ---
  {
    'title': 'Signature T-Shirt',
    'price': '£14.99',
    'imageUrl': 'assets/images/signature_tshirt.png',
  },
  {
    'title': 'Signature Hoodie',
    'price': '£32.99',
    'imageUrl': 'assets/images/signature_hoodie.png',
  },
  {
    'title': 'Limited Edition Essential Zip Hoodies',
    'price': '£20.00 £14.99',
    'imageUrl': 'assets/images/essential_zip_hoodie.png',
  },
  {
    'title': 'Essential T-Shirt',
    'price': '£10.99 £6.99',
    'imageUrl': 'assets/images/essential_tshirt.png',
  },
  // --- Clothing ---
  {
    'title': 'Classic Hoodies',
    'price': '£25.00',
    'imageUrl': 'assets/images/clothing1.png',
  },
  {
    'title': 'Classic sweatshirts',
    'price': '£23.00',
    'imageUrl': 'assets/images/clothing2.png',
  },
  {
    'title': 'Classic T-Shirts',
    'price': '£11.00',
    'imageUrl': 'assets/images/clothing3.png',
  },
  {
    'title': 'Classic Sweatshirts - neutral',
    'price': '£17.00 £10.99',
    'imageUrl': 'assets/images/clothing4.png',
  },
  {
    'title': 'Graduation Hoodies',
    'price': '£35.00',
    'imageUrl': 'assets/images/clothing5.png',
  },
  {
    'title': 'Graduation 3/4 Zipped Sweatshirt',
    'price': '£45.00',
    'imageUrl': 'assets/images/clothing6.png',
  },
  {
    'title': 'Classic Cap',
    'price': '£12.00',
    'imageUrl': 'assets/images/clothing7.png',
  },
  {
    'title': 'Classic limited edition Hoodie',
    'price': '£30.00 £12.99',
    'imageUrl': 'assets/images/clothing8.png',
  },
  {
    'title': 'Heavyweight Shorts',
    'price': '£30.00 £12.99',
    'imageUrl': 'assets/images/clothing9.png',
  },
  {
    'title': 'Signiture Hoodie',
    'price': '£30.00 £12.99',
    'imageUrl': 'assets/images/clothing10.png',
  },
  {
    'title': 'Ladies athletic Leggings',
    'price': '£26.00 £12.99',
    'imageUrl': 'assets/images/clothing11.png',
  },
  {
    'title': 'Essential T-Shirt',
    'price': '£10.99 £6.99',
    'imageUrl': 'assets/images/clothing12.png',
  },
  {
    'title': 'Limmited Edition Essential Zip Hoodies',
    'price': '£20.00 £6.99',
    'imageUrl': 'assets/images/clothing13.png',
  },
  {
    'title': 'Waterproof poncho',
    'price': '£1.99',
    'imageUrl': 'assets/images/clothing14.png',
  },
  {
    'title': 'Classic Burgendy Hoodie',
    'price': '£25.00 £12.00',
    'imageUrl': 'assets/images/clothing15.png',
  },
  {
    'title': 'Signature T-Shirt',
    'price': '£25.00 £12.00',
    'imageUrl': 'assets/images/clothing16.png',
  },
  {
    'title': 'Limited Edition UoM Beanies',
    'price': '£7.50',
    'imageUrl': 'assets/images/clothing17.png',
  },
  // --- Merchandise ---
  {
    'title': 'ID Holder',
    'price': '£0.75',
    'imageUrl': 'assets/images/m1.png',
  },
  {
    'title': 'Lanyards',
    'price': '£2.75',
    'imageUrl': 'assets/images/m2.png',
  },
  {
    'title': 'Graduation bears',
    'price': 'sold out',
    'imageUrl': 'assets/images/m3.png',
  },
  {
    'title': 'UoP cotton shopper',
    'price': '£1.99',
    'imageUrl': 'assets/images/m4.png',
  },
  {
    'title': 'Pen',
    'price': '£1.00',
    'imageUrl': 'assets/images/m5.png',
  },
  {
    'title': 'limited edition Lanyard',
    'price': '£2.75',
    'imageUrl': 'assets/images/m6.png',
  },
  {
    'title': 'Lapel Pin',
    'price': '£4.00',
    'imageUrl': 'assets/images/m7.png',
  },
  {
    'title': 'Crested Tie',
    'price': '£15.00 £10.99',
    'imageUrl': 'assets/images/m8.png',
  },
  {
    'title': 'Crested bag',
    'price': '£7.00 £4.99',
    'imageUrl': 'assets/images/m9.png',
  },
  {
    'title': 'Keep Cups',
    'price': '£6.50',
    'imageUrl': 'assets/images/m10.png',
  },
  {
    'title': 'classic beanie hat',
    'price': '£6.50',
    'imageUrl': 'assets/images/clothing17.png',
  },
  {
    'title': '8GB USBs',
    'price': '£7.50 £5.50',
    'imageUrl': 'assets/images/m11.png',
  },
  {
    'title': 'A5 Notepad',
    'price': 'Sold out',
    'imageUrl': 'assets/images/m12.png',
  },
  {
    'title': 'Classic Cap',
    'price': '£12.00',
    'imageUrl': 'assets/images/clothing7.png',
  },
  {
    'title': 'Crested Notebook',
    'price': '£10.50 £7.99',
    'imageUrl': 'assets/images/m13.png',
  },
  {
    'title': 'Recycled Notebook',
    'price': '£1.80',
    'imageUrl': 'assets/images/m14.png',
  },
  {
    'title': 'UoP Teddie bear',
    'price': 'Sold out',
    'imageUrl': 'assets/images/m15.png',
  },
  {
    'title': 'Portsmouth City Postcard',
    'price': '£1.00',
    'imageUrl': 'assets/images/m16.png',
  },
  {
    'title': 'Portsmouth City Magnet',
    'price': '£4.50',
    'imageUrl': 'assets/images/m17.png',
  },
  {
    'title': 'Portsmouth City Bookmark',
    'price': '£3.00',
    'imageUrl': 'assets/images/m18.png',
  },
  {
    'title': 'Type C charge and Synce Cable',
    'price': '£3.00 £1.50',
    'imageUrl': 'assets/images/m19.png',
  },
  {
    'title': 'USB to USB charge and Synce Cables',
    'price': '£3.00 £1.50',
    'imageUrl': 'assets/images/m20.png',
  },
  {
    'title': 'Limited edition bracelet',
    'price': '£1.00 £0.50',
    'imageUrl': 'assets/images/m21.png',
  },
  {
    'title': 'waterproof Poncho',
    'price': '£1.99',
    'imageUrl': 'assets/images/clothing14.png',
  },
  {
    'title': 'Portsmouth City Notebook',
    'price': '£7.50',
    'imageUrl': 'assets/images/m23.png',
  },
  {
    'title': 'Portsmouth City Keyring',
    'price': '£6.75',
    'imageUrl': 'assets/images/m24.png',
  },
  {
    'title': 'Portsmouth City Coaster',
    'price': '£4.50',
    'imageUrl': 'assets/images/m25.png',
  },
  {
    'title': 'Portsmouth City water bottle',
    'price': '£2.50',
    'imageUrl': 'assets/images/m26.png',
  },
  // --- Halloween ---
  {
    'title': 'Halloween Tote Bag',
    'price': '£2.50',
    'imageUrl': 'assets/images/m27.png',
  },
];

// --- Search Delegate for all products ---
class AllProductsSearchDelegate extends SearchDelegate<Map<String, String>?> {
  final List<Map<String, String>> items;
  AllProductsSearchDelegate(this.items);

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
                onTap: () {},
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
              onTap: () {},
            )),
      ],
    );
  }
}

// --- AppBar Widget ---
class _SignatureAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearch;
  const _SignatureAppBar({required this.onSearch});

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
                value: '/signature',
                child: const Text('Signature & Essential'),
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
                onPressed: () {},
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
                      onPressed: null,
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

// --- Signature & Essential Range Page ---
class SignatureEssentialPage extends StatelessWidget {
  const SignatureEssentialPage({super.key});

  void _showSearch(BuildContext context) {
    showSearch<Map<String, String>?>(
      context: context,
      delegate: AllProductsSearchDelegate(allProducts),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SignatureAppBar(
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
                'Signature & Essential Range',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Discover effortless style and comfort with our latest drop - the Signature & Essential range. The Signature line features premium embroidered hoodies in limited colours, plus the new Signature T-Shirt, combining classic design with elevated details. The Essential line offers versatile, must-have t-shirts with a fresh chest logo design, adding a clean, modern touch to your daily rotation.\n\nPlus, grab the limited edition zip hoodie while stocks last - a standout piece designed for those who move differently.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Filter and Sort Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: 'All products',
                    items: const [
                      DropdownMenuItem(value: 'All products', child: Text('All products')),
                    ],
                    onChanged: (val) {},
                  ),
                  DropdownButton<String>(
                    value: 'Alphabetically, Z-A',
                    items: const [
                      DropdownMenuItem(value: 'Alphabetically, Z-A', child: Text('Alphabetically, Z-A')),
                    ],
                    onChanged: (val) {},
                  ),
                  Text(
                    '${signatureEssentialProducts.length} products',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Products Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 4 : 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 32,
                childAspectRatio: 0.8,
                children: signatureEssentialProducts.map((product) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['imageUrl']!,
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
                      const SizedBox(height: 8),
                      Text(
                        product['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['price']!,
                        style: const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}