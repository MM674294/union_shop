import 'package:flutter/material.dart';
import 'package:union_shop/item_detail_page.dart';

// --- All Products (Signature, Essential, Clothing, Merchandise, Halloween, etc.) ---
final List<Map<String, String>> allProducts = [
  // ... your product list ...
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

// --- Custom AppBar Widget with Banner and Hamburger Menu (right side) ---
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext parentContext;
  const CustomAppBar({required this.parentContext, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: const Color(0xFF4d2963),
            child: const Center(
              child: Text(
      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 16),
      maxLines: 2, // Allow wrapping to two lines if needed
      overflow: TextOverflow.ellipsis,
    ),
  ),
),
          // Navigation bar (row)
          Container(
            height: 56,
            color: Colors.white,
            child: Row(
              children: [
                // Logo (left)
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
                // Only icons on the right
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
                    // Hamburger menu (far right)
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Color(0xFF4d2963)),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: 'Open navigation menu',
                      ),
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

// --- Drawer for navigation with nested expansion ---
class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool shopExpanded = false;
  bool printShackExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF4d2963),
            ),
            child: Row(
              children: [
                Image.network(
                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      width: 40,
                      height: 40,
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                const Text('The UNION', style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Shop'),
            trailing: Icon(shopExpanded ? Icons.expand_less : Icons.chevron_right),
            initiallyExpanded: shopExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                shopExpanded = expanded;
              });
            },
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Clothing'),
                onTap: () {
                  Navigator.pushNamed(context, '/clothing');
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Merchandise'),
                onTap: () {
                  Navigator.pushNamed(context, '/merchandise');
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Halloween 🎃'),
                onTap: () {
                  Navigator.pushNamed(context, '/halloween');
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Signature & Essential Range'),
                onTap: () {
                  Navigator.pushNamed(context, '/signature');
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Page 6'),
                onTap: () {
                  Navigator.pushNamed(context, '/page6');
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Page 7'),
                onTap: () {
                  Navigator.pushNamed(context, '/page7');
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Page 8'),
                onTap: () {
                  Navigator.pushNamed(context, '/page8');
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('The Print Shack'),
            trailing: Icon(printShackExpanded ? Icons.expand_less : Icons.chevron_right),
            initiallyExpanded: printShackExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                printShackExpanded = expanded;
              });
            },
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Page 1'),
                onTap: () {
                  Navigator.pushNamed(context, '/page1');
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 56, right: 16),
                title: const Text('Page 2'),
                onTap: () {
                  Navigator.pushNamed(context, '/page2');
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('Sale'),
            onTap: () {
              Navigator.pushNamed(context, '/sale');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}

// Usage in your page's Scaffold:
// Scaffold(
//   appBar: CustomAppBar(parentContext: context),
//   drawer: const AppDrawer(),
//   body: ...,
// )