import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
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
    return Column(
      children: [
        // Banner at the top
        CustomAppBar.getBanner(),
        // Scaffold with navigation bar and body
        Expanded(
          child: Scaffold(
            appBar: CustomAppBar(parentContext: context),
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
              const SizedBox(height: 32),
              const Text(
                'Personalisation Service',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Customise your products with our exclusive personalisation service! Add your name, message, or logo to make it truly yours.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              // Product section (like Print Shack Personalise)
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
              // Add to cart and personalisation section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personalisation',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '£3.00',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              // ...existing code...
SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF4d2963),
      side: const BorderSide(color: Color(0xFF4d2963)),
      padding: const EdgeInsets.symmetric(vertical: 18),
    ),
    onPressed: () {
      String details = 'Option: $_selectedOption';
      if (_linesRequired >= 1) details += '\nLine 1: ${_line1Controller.text}';
      if (_linesRequired >= 2) details += '\nLine 2: ${_line2Controller.text}';
      if (_linesRequired >= 3) details += '\nLine 3: ${_line3Controller.text}';
      if (_linesRequired >= 4) details += '\nLine 4: ${_line4Controller.text}';

      setState(() {
        cartItems.add({
          'title': 'Personalised Product',
          'price': '£3.00',
          'image': _mainImage,
          'details': details,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to cart!')),
      );
    },
    child: const Text('Add to Cart'),
  ),
),
// ...existing code...
              const SizedBox(height: 16),
              // Info section
              const Text(
                'How it works:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Choose your product and personalisation option.\n'
                '2. Enter your text or upload your logo.\n'
                '3. Our team will handle the rest and let you know when your item is ready!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Text(
                'Pricing:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                '£3 for one line of text (up to 10 characters).\n'
                '£5 for two lines of text or a large logo.\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Text(
                'Please ensure all spellings are correct before submitting your order. Personalised items do not qualify for refunds.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
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
          ),
        ),
      ],
    );
  }
}