import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  String _deliveryMethod = 'Ship';
  String _country = 'United Kingdom';

  double get subtotal => cartItems.fold(
      0.0,
      (sum, item) =>
          sum + (double.tryParse(item['price'].toString().replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0));

  double get tax => subtotal * 0.20;
  double get shipping => _deliveryMethod == 'Ship' ? 5.99 : 0.0;
  double get total => subtotal + tax + shipping;

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar.getBanner(),
        Expanded(
          child: Scaffold(
            appBar: CustomAppBar(parentContext: context),
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Checkout',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 24),
                          // Contact Section
                          const Text(
                            'Contact',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) return 'Email is required';
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          // Delivery Section
                          const Text(
                            'Delivery',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          // Country Dropdown
                          DropdownButtonFormField<String>(
                            initialValue: _country,
                            items: const [
                              DropdownMenuItem(value: 'United Kingdom', child: Text('United Kingdom')),
                              DropdownMenuItem(value: 'Ireland', child: Text('Ireland')),
                              DropdownMenuItem(value: 'France', child: Text('France')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _country = value!;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Country/Region',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _firstNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'First name',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) return 'First name is required';
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: _lastNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Last name',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) return 'Last name is required';
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                              labelText: 'Address',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) return 'Address is required';
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _cityController,
                                  decoration: const InputDecoration(
                                    labelText: 'City',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) return 'City is required';
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: _postalCodeController,
                                  decoration: const InputDecoration(
                                    labelText: 'Postal code',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) return 'Postal code is required';
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Delivery Method
                          const Text('Delivery Method', style: TextStyle(fontWeight: FontWeight.w500)),
                          RadioListTile<String>(
                            title: const Text('Ship (£5.99)'),
                            value: 'Ship',
                            groupValue: _deliveryMethod,
                            onChanged: (value) {
                              setState(() {
                                _deliveryMethod = value!;
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: const Text('Pick up (Free)'),
                            value: 'Pickup',
                            groupValue: _deliveryMethod,
                            onChanged: (value) {
                              setState(() {
                                _deliveryMethod = value!;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          // Payment Section
                          const Text(
                            'Payment',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _cardNumberController,
                            decoration: const InputDecoration(
                              labelText: 'Card number',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.credit_card),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) return 'Card number is required';
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _expiryController,
                                  decoration: const InputDecoration(
                                    labelText: 'MM/YY',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) return 'Expiry date is required';
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: _cvvController,
                                  decoration: const InputDecoration(
                                    labelText: 'CVV',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) return 'CVV is required';
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          // Order Summary
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Order Summary',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Subtotal:'),
                                    Text('£${subtotal.toStringAsFixed(2)}'),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Tax:'),
                                    Text('£${tax.toStringAsFixed(2)}'),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Shipping:'),
                                    Text('£${shipping.toStringAsFixed(2)}'),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total:',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '£${total.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4d2963),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Pay Now Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Order placed successfully!')),
                                  );
                                  cartItems.clear();
                                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text(
                                'PAY NOW',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
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