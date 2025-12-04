import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

class PrintShackPersonalisePage extends StatefulWidget {
  const PrintShackPersonalisePage({super.key});

  @override
  State<PrintShackPersonalisePage> createState() => _PrintShackPersonalisePageState();
}

class _PrintShackPersonalisePageState extends State<PrintShackPersonalisePage> {
  String _mainImage = 'assets/images/yournamehere1.png';
  final List<String> _images = [
    'assets/images/yournamehere1.png',
    'assets/images/yournamehere2.png',
    'assets/images/yournamehere3.png',
  ];

  String _selectedOption = 'One Line of Text';
  final List<String> _options = [
    'One Line of Text',
    'Two Lines of Text',
    'Three Lines of Text',
    'Four Lines of Text',
    'Small Logo (Chest)',
    'Large Logo (Back)',
  ];

  final TextEditingController _line1Controller = TextEditingController();
  final TextEditingController _line2Controller = TextEditingController();
  final TextEditingController _line3Controller = TextEditingController();
  final TextEditingController _line4Controller = TextEditingController();

  @override
  void dispose() {
    _line1Controller.dispose();
    _line2Controller.dispose();
    _line3Controller.dispose();
    _line4Controller.dispose();
    super.dispose();
  }

  int get _linesRequired {
    switch (_selectedOption) {
      case 'Two Lines of Text':
        return 2;
      case 'Three Lines of Text':
        return 3;
      case 'Four Lines of Text':
        return 4;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main Image
              Center(
                child: SizedBox(
                  width: 350,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      _mainImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Thumbnails
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _images.map((img) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _mainImage = img;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _mainImage == img ? const Color(0xFF4d2963) : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Image.asset(
                        img,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          width: 60,
                          height: 60,
                          child: const Icon(Icons.image_not_supported, color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              // Title and Price
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personalisation',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '£3.00',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tax included.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              // Dropdown
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Per Line:  $_selectedOption',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedOption,
                isExpanded: true,
                items: _options.map((opt) {
                  return DropdownMenuItem(
                    value: opt,
                    child: Text(opt),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedOption = val!;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Personalisation lines
              for (int i = 1; i <= _linesRequired; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: [
                      _line1Controller,
                      _line2Controller,
                      _line3Controller,
                      _line4Controller
                    ][i - 1],
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Personalisation Line $i',
                      border: const OutlineInputBorder(),
                      counterText: '',
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Add to cart logic here
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF4d2963),
                    side: const BorderSide(color: Color(0xFF4d2963)),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Pricing note
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '£3 for one line of text! £5 for two!\n\nOne line of text is 10 characters.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              // Terms and conditions
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please ensure all spellings are correct before submitting your purchase as we will print your item with the exact wording you provide. We will not be responsible for any incorrect spellings printed onto your garment. Personalised items do not qualify for refunds.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
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
    );
  }
}