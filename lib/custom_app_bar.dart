import 'package:flutter/material.dart';
import 'clothing_page.dart'; // For cartItems and CartPage

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext parentContext;
  final Function(BuildContext)? onSearch;
  const CustomAppBar({super.key, required this.parentContext, this.onSearch});

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
                value: '/page3',
                child: const Text('Page 3'),
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
                onPressed: () {
                  if (onSearch != null) {
                    onSearch!(parentContext);
                  }
                },
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
              // Removed the menu IconButton (three lines in the corner)
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}