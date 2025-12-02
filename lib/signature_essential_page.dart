import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/item_detail_page.dart';
import 'package:union_shop/footer.dart';

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

// --- Signature & Essential Range Page ---
class SignatureEssentialPage extends StatelessWidget {
  const SignatureEssentialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(), // <-- Add this for the hamburger menu
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ItemDetailPage(item: product),
                        ),
                      );
                    },
                    child: Column(
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
                    ),
                  );
                }).toList(),
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
    );
  }
}