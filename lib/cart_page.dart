import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _noteController = TextEditingController();

  double get subtotal => cartItems.fold(
      0.0,
      (sum, item) =>
          sum + (double.tryParse(item['price'].toString().replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0));

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your cart',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Continue shopping'),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(child: Text('Product', style: TextStyle(fontWeight: FontWeight.bold))),
                  Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(),
              if (cartItems.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(
                    child: Text(
                      'Your cart is empty.',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                )
              else
                ...cartItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item['image'] ?? '',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['title'] ?? '', style: const TextStyle(fontSize: 16)),
                              if (item['details'] != null && item['details'] != '')
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    item['details'],
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          item['price'] ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                          child: const Text('REMOVE'),
                        ),
                      ],
                    ),
                  );
                }),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 12),
              const Text(
                'Add a note to your order',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _noteController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '£${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Tax included and shipping calculated at checkout',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15),
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