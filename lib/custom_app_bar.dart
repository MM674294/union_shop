import 'package:flutter/material.dart';

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

// --- Cart Items (shared cart state) ---
List<Map<String, dynamic>> cartItems = [];

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

// --- Custom AppBar Widget with Banner ---
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext parentContext;
  const CustomAppBar({required this.parentContext, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100 + 56);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top banner with promotional text
          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Center(
              child: Text(
                'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          // Navigation bar (row)
          Container(
            height: 56,
            color: Colors.white,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 32,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 32,
                          height: 32,
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        );
                      },
                    ),
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
                  hint: const Text(
                    'Shop',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                      onPressed: () {
                        showSearch<Map<String, String>?>(
                          context: parentContext,
                          delegate: AllProductsSearchDelegate(allProducts),
                        );
                      },
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
                            Navigator.pushNamed(context, '/cart');
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
          ),
        ],
      ),
    );
  }
}