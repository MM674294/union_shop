import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/item_detail_page.dart';
import 'package:union_shop/footer.dart';

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
      children: results.isEmpty
          ? [
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(child: Text('No results found.')),
              )
            ]
          : results
              .map((item) => ListTile(
                    leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
                    title: Text(item['title']!),
                    subtitle: Text(item['price']!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ItemDetailPage(item: item),
                        ),
                      );
                    },
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ItemDetailPage(item: item),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}

// --- Halloween Bags Page ---
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
      appBar: CustomAppBar(parentContext: context),
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
              Footer(
                onEmailSubmitted: (email) {
                  print('User subscribed with email: $email');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSearch(context),
        child: const Icon(Icons.search),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
        tooltip: 'Search Products',
      ),
    );
  }
}